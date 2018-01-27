packages <- c('tidyverse', 'stringr', 'igraph', 'diagram', 'tinkR')
sapply(packages, library, character.only = T)
g <- read_graph("data_vis_survey.graphml", 'graphml')

dontInclude = c(
  "Timestamp",
  "What community support / discussions / advice would you want to see from data visualization thought leaders?",
  "What one change would make your job better?",
  "What do you think other people in your organization just don’t get about the data visualization work that you do?",
  "If you could change one thing about your data visualization work what would it be?",
  "If you could change one thing about your job what would it be?",
  "What is your biggest frustration with doing data visualization in your job?",
  "What is your biggest frustration with your job?",
  "What is your official job title?")

removeEdges <- function(g, filter){
  g %>%
    E() %>%
    .[eval(parse(text = filter))] %>%
    reverse_subgraph_edges(g)
}

createEdgeList <- function(g, notIncluding){
  fun.env <- new.env()
  fun.env$g <- g
  
  sapply(notIncluding, function(x){
    filterString <- str_c('type !="', x, '"')
    fun.env$g <- removeEdges(fun.env$g, filterString)
  })
  
  edgeList <- fun.env$g %>% ends(E(.)) %>% as.tibble()
  edgeType <- fun.env$g %>% E() %>% .$type
  
  tibble(
    source = edgeList[[1]],
    target = edgeList[[2]],
    edgeType = edgeType
  )
}

createNodeList <- function(g, notIncluding){
  fun.env <- new.env()
  fun.env$g <- g
  
  sapply(notIncluding, function(x){
    filterString <- str_c('type !="', x, '"')
    fun.env$g <- removeEdges(fun.env$g, filterString)
  })
  
  nodeList <- V(fun.env$g)$name
  nodeType <- V(fun.env$g)$type
  tibble(
    name = nodeList,
    type = nodeType
  )
}

el <- createEdgeList(g, dontInclude)
nl <- createNodeList(g, dontInclude)
q <- el$edgeType %>% unique
r <- lapply(setNames(q, q), function(x){
  el %>% filter(edgeType == x) %>% .$target %>% unique %>% sort()
})

r %>% setNames(nm = names(r)) %>% lapply(function(x){head(x, 20)} )

netJson <- list(
  edges = el,
  nodes = nl,
  questions = lapply(seq_along(q), function(i){
    list(
      question = q[[i]],
      responses = r[[i]]
    )
  })
) %>%
  jsonlite::toJSON()

write(netJson, 'dataVizSurveyGraph.json')

jobs <- g %>%
  E() %>%
  .[type == "What is your official job title?"] %>%
  reverse_subgraph_edges(g) %>%
  degree(mode = 'in') %>%
  .[. > 0] %>%
  sort(T)



journalist <- jobs %>% 
  .[names(.) %>% str_detect(regex('journal|edit|story', ignore_case = T))] %>%
  names() 
datascience <- jobs %>% 
  .[names(.) %>% str_detect(regex('data.*sci', ignore_case = T))] %>%
  names()
scientist <- jobs %>% 
  .[names(.) %>% str_detect(regex('sci|stat', ignore_case = T))] %>% 
  .[!names(.) %>% str_detect(regex('data', ignore_case = T))] %>%
  names()
gis <- jobs %>%
  .[names(.) %>% str_detect(regex('gis |map|cart', ignore_case = T))] %>%
  names()
analyst <- jobs %>%
  .[names(.) %>% str_detect(regex('analyst', ignore_case = T))] %>%
  names()
designer <- jobs %>%
  .[names(.) %>% str_detect(regex('design', ignore_case = T))] %>%
  names()
vis <- jobs %>% 
  .[names(.) %>% str_detect(regex('vis|viz', ignore_case = T))] %>%
  names()

job_cat <- c('journalist', 'datascience', 'scientist', 'gis', 'analyst', 'designer', 'vis')

job_nodes <- lapply(job_cat, function(x){
  templist <- list(get(x))
  names(templist) <- x
  templist
})

test <- c()

journalist %>% sapply(function(x){test <<- c(test,x, 'journalist')})

test_g <- g %>%
  add_vertices(1, name = 'journalist') %>%
  add_edges(test)

test_g <- g

sapply(job_cat, function(x){
  nodeName <- str_c(x,' (job category)')
  fml <- new.env(parent = baseenv()) 
  fml.env <- new.env()
  assign('tempVect', c(), envir = fml.env)
  get(x) %>% 
    sapply(function(y){
      assign('tempVect', c(fml.env$tempVect, y, nodeName), envir = fml.env)
      })
  test_g <<- test_g %>%
    add_vertices(1, name = nodeName, type = 'job category') %>%
    add_edges(fml.env$tempVect, type = 'belongs to')
})

job_cat_graph <- test_g %>%
  V() %>%
  .[str_detect(name, '(job category)')] %>%
  reverse_ego(test_g, 2, 'in') %>%
  unlist %>%
  names %>%
  reverse_induced_subgraph(test_g) %>%
  V() %>%
  .[type == 'person'] %>%
  .$name %>%
  unique %>%
  reverse_ego(test_g, 2, 'out') %>%
  unlist %>%
  names() %>%
  reverse_induced_subgraph(test_g)

write_graph(job_cat_graph, 'data_viz_job_category.graphml', 'graphml')

job_cat_graph <- read_graph('data_viz_job_category.graphml', 'graphml')

peopleOfCat <- function(g, category){
  g %>%
    V() %>%
    .[name == category] %>%
    reverse_ego(g, 2, 'in') %>%
    unlist %>%
    names() %>%
    reverse_induced_subgraph(g) %>%
    V() %>%
    .[type == 'person'] %>% 
    .$name
}

peopleOfCatAnswered <- function(g, category, question){
  peopleOfCat(g, category) %>%
    reverse_ego(g, 2, 'out') %>%
    unlist %>%
    names() %>%
    reverse_induced_subgraph(g) %>%
    save_as('tempGraph') %>%
    E() %>%
    .[type == question] %>%
    reverse_subgraph_edges(tempGraph) %>%
    degree(mode = 'in') %>%
    .[. > 0] %>%
    sort(T)
}

categories <- job_cat_graph %>%
  V() %>%
  .[type == 'job category'] %>%
  .$name %>%
  unique

peopleOfCat(job_cat_graph, 'journalist (job category)')
trial <- peopleOfCatAnswered(job_cat_graph, 'journalist (job category)',"What is your official job title?")
peopleOfCatAnswered(job_cat_graph, "scientist (job category)", "How do you present your data visualizations?")

pquestions <- job_cat_graph %>% E() %>% .[str_detect(type, regex('percent', ignore_case = T))] %>% .$type %>% unique

avePercentDay <- function(x){
  x <- x %>% .[names(.) != 'NA']
  n <- names(x) %>% as.numeric
  rep(n, x) %>% mean
}

getRepresentative <- function(g, people, tech, heros){
  tech <- tech %>% .[names(.) != 'NA'] %>% .[. >1] %>% names
  heros <- heros %>% .[names(.) != 'NA'] %>% .[.>1] %>% names
  nodes <- c(tech, heros, people) %>% unique
  induced_subgraph(g, nodes) %>%
    degree(mode = 'out') %>%
    sort(T) %>% 
    .[. == max(.)]
}

job_cat_graph %>% E() %>% .$type %>% unique


getFreeResponses <- function(g, person){
  questions <- c("Who do you make data visualizations for?",
    "What knowledge level do they have of the data you are visualizing for them?",
    "How often do they consume your data visualizations?",
    "What do they use your data visualizations for?",
    "How would you describe the relationship?",
    "What is your biggest frustration with your job?",
    "What is your biggest frustration with doing data visualization in your job?",
    "If you could change one thing about your job what would it be?",
    "If you could change one thing about your data visualization work what would it be?",
    "What do you think other people in your organization just don’t get about the data visualization work that you do?",
    "What one change would make your job better?",
    "What community support / discussions / advice would you want to see from data visualization thought leaders?")
  
  orderedTibble <- tibble(question = questions)
  
  tempTibble <- ego(g, 1, person)[[1]] %>% 
    reverse_induced_subgraph(g) %>% 
    save_as('tempGraph') %>%
    E() %>%
    .[type %in% questions] %>%
    save_as('tempEdges') %>%
    reverse_subgraph_edges(tempGraph) %>%
    ends(E(.)) %>%
    as.tibble() %>%
    rename(person = V1,
           response = V2) %>%
    mutate(question = tempEdges$type) 
  
  left_join(orderedTibble, tempTibble) %>%
    select(person, question, response) %>%
    group_by(person, question) %>%
    nest %>%
    mutate(response = sapply(data, function(x){
      x$response %>%
        str_c(collapse = ';')
    })) %>%
    select(-data)
}

trial <- getRepresentative(job_cat_graph, categoryInfo[[4]]$practicioners, categoryInfo[[4]]$tech, categoryInfo[[4]]$heros)
trial2<- getFreeResponses(job_cat_graph, trial%>%names)


categoryInfo <- lapply(setNames(categories,categories), function(x){
  tech <-peopleOfCatAnswered(job_cat_graph, x, "What technologies do you use to visualize data?")
  heros <- peopleOfCatAnswered(job_cat_graph, x, "Who do you look to as a thought leader in data visualization?")
  presentation <- peopleOfCatAnswered(job_cat_graph, x, "How do you present your data visualizations?")
  practicioners <- peopleOfCat(job_cat_graph, x)
  jobs <- peopleOfCatAnswered(job_cat_graph, x, "What is your official job title?")
  percents <- lapply(setNames(pquestions, pquestions), function(y){
    peopleOfCatAnswered(job_cat_graph, x, y) %>% avePercentDay()
  })
  representative <- getRepresentative(job_cat_graph, practicioners, tech, heros)
  list(
    allNodes = c(tech %>% names, 
                 practicioners#, 
#                 heros %>% names, 
#                 presentation %>% names
  ),
    topNodes = c(tech %>% .[names(.) != 'NA'] %>% head(10) %>% names#, 
#                 heros %>% .[names(.) != 'NA'] %>% head(5) %>% names, 
#                 presentation %>% .[names(.) != 'NA'] %>% head(5)%>% names
  ),
    job = x,
    tech = tech,
    heros = heros, 
    practicioners = practicioners,
    jobs = jobs %>% names %>% sort(),
    percents = percents,
    representativeProfile = getFreeResponses(job_cat_graph, representative)
  )
})

categoryInfo %>% lapply(function(x){
  question = x$percents %>% names
  aveResponse = x$percents %>% unlist
  tibble(question, aveResponse)
  })

library(ggraph)

dataVizNet <- function(g, catInfo){
  catInfo$allNodes %>%
    reverse_induced_subgraph(g) %>%
    save_as('tempGraph') %>%
    ggraph(layout = 'kk') +
    geom_edge_fan(alpha = .1) +
    geom_node_label(aes(label = sapply(V(tempGraph)$name, function(x){
      if(x %in% catInfo$topNodes){
        x
      } else {
        NA
      }})), alpha = .5) +
    theme_void() +
    ggtitle(catInfo$job %>% str_to_title())
}

dataVizNet(job_cat_graph, categoryInfo[[1]])

lapply(categoryInfo, function(x){
  fileName <- str_extract(x$job, '^\\w*') %>%
    str_to_upper() %>%
    str_c('_network.pdf')
  cairo_pdf(fileName)
  dataVizNet(job_cat_graph, x) %>% print
  dev.off()
})

trial <- tibble(
  names = categoryInfo[[1]]$tech %>% names %>% head(10),
  n = categoryInfo[[1]]$tech %>% head(10)
)

createTempTibble <- function(catInfo, measure){
  information <- catInfo[[measure]] %>% .[names(.) != 'NA']
  tibble(
    names = information %>% names %>% head(10),
    n = information %>% head(10)
  )
}

createBar <- function(catInfo, measure, x, y, titleAdd){
  catTibble = createTempTibble(catInfo, measure)
  
  ggplot(catTibble) +
    geom_col(aes(x = factor(names, levels = names %>% rev),
                 y = catInfo$practicioners %>% length,
                 fill = 'Total')) +
    coord_flip() +
    geom_col(aes(x = factor(names, levels = names %>% rev),
                 y = n,
                 fill = 'Answered')) + 
    coord_flip() +
    scale_fill_manual('', 
                      breaks = c('Answered', "Total"),
                      values = c("Answered" ='darkslategray', "Total" = 'lightgrey')) + 
    labs(x =  x,
         y = y, 
         title = catInfo$job %>% 
           str_to_upper() %>%
           str_replace('\\s\\(.*\\)', '') %>%
           str_c(': Top Ten ', titleAdd)) +
    theme_classic()
}


createBar(catInfo = categoryInfo[[1]],
          'tech',
          "Technology Used", 
          "Number of Practicioners Using Tech", 
          "Tech")

library(gridExtra)
lapply(categoryInfo, function(x){
  jerb <- x$job %>%
    str_replace('\\s\\(.*\\)', '') %>%
    str_to_upper
  
  # filename1 <- str_c(jerb, '_tech.pdf')
  # filename2 <- str_c(jerb, '_watch')
  
  fullFilename <- str_c(jerb, '_TechAndWatch.pdf')
  # cairo_pdf(filename1)
  # dev.off()
  techBar <- createBar(x,
                       'tech',
                       'Technology Used',
                       str_c("Number of ", jerb, ' Using Tech'),
                       "Technologies Used")
  heroBar <- createBar(x,
                       'heros',
                       'Considered A Thought Leader',
                       str_c('Number of ', jerb, ' choosing Thought Leader'),
                       'Thought Leaders')
  
  cairo_pdf(fullFilename)
  grid.arrange(techBar, heroBar, ncol = 1) %>% print()
  dev.off()
  # cairo_pdf(filename2)
  # dev.off()
})



categoryInfo %>% lapply(function(x){x$tech %>% .[. > 1]})

cairo_pdf('_title.pdf')
plot(0:10, type = "n", xaxt="n", yaxt="n", bty="n", xlab = "", ylab = "")
text(5, 9, "What do practicioners of Data Viz use")
text(5, 8, "and who do they look up to?")
text(5, 5, "Explored by: @plzbeemyfriend")
dev.off()
