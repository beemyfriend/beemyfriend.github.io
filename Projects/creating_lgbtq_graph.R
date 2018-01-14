packages <- c('tidyverse', 'stringr', 'igraph', 'tidytext')
sapply(packages, library, character.only = T)

x <- read_csv('topicPackageLinkTitleAuthorDesc.csv')
x$pAuthor %>% head

trial <- x %>% nest(topic) %>% mutate(topic = sapply(data, function(x){x$topic %>% str_c(collapse = ';')})) %>% select(-data)

write_csv(trial, 'r_package_taskforce.csv')

lgbtq <- read_csv('incomplete_lgbtq_movie_dataset.csv')

lgbtq %>% filter(str_detect(desc, regex('musical', ignore_case = T))) %>% select(desc)

genre_catch <- function(x, rx, type){
  
  does_exist <- x %>%
    str_detect(regex(rx, ignore_case = T))

  if(does_exist){
    type
  } else {
    NA
  }
}

lgbtq <- lgbtq %>%
  group_by(mTitle) %>%
  nest %>%
  mutate(data = lapply(seq_along(data), function(i){
    d = .$data[[i]]
    t = .$mTitle[i]
    if(d %>% nrow > 1){
      d %>% 
        mutate(movie = sapply(seq_along(desc), function(j){
          str_c(t, ' (movie) ', j)
        }))
    } else {
      d %>%
        mutate(movie = str_c(t, ' (movie)'))
    }})) %>% 
  unnest() %>%
  mutate(genres = sapply(desc, function(x){
    comedy = genre_catch(x, 'comedy|comedic|humor', 'comedy')
    horror = genre_catch(x, 'horror', 'horror')
    drama = genre_catch(x, 'drama', 'drama')
    romance = genre_catch(x, 'romance|romantic|love', 'romance')
    action = genre_catch(x, 'action', 'action') 
    thriller = genre_catch(x, 'thriller', 'thriller')
    thrasher = genre_catch(x, 'thrasher', 'thrasher')
    genres <- c('lgbtq', comedy, horror, drama, romance, action, thriller, thrasher) %>% na.omit %>% str_c(collapse = ';')
    
    if(identical(genres, character(0))){
      NA
    } else {
      genres
    }
  }))

get_links <- function(df, columnSource, splitSource, columnTarget, splitTarget, type){
  temp <- df %>%
    select_(columnSource, columnTarget) %>%
    mutate(type = type) %>%
    filter_(!is.na(columnSource),
           !is.na(columnTarget))
  
  if(splitSource %>% is.character){
    temp <- temp %>%
      mutate_(columnSource = columnSource %>% str_split(splitSource)) %>%
      unnest()
  }
  
  if(splitTarget %>% is.character){
    temp <- temp %>%
      mutate_(columnTarget = columnTarget %>% str_split(splitTarget)) %>%
      unnest()
  }  
  
  temp
}


directed_by_links <- lgbtq %>%
  select(directed_by, movie) %>%
  mutate(directed_by = str_split(directed_by, ';'),
         type = 'directed') %>%
  unnest %>% 
  filter(!is.na(directed_by)) %>%
  rename(person = directed_by) %>%
  select(person, movie, type)

produced_by_links <- lgbtq%>%
  select(produced_by, movie) %>%
  mutate(produced_by = str_split(produced_by, ';'),
         type = 'produced') %>%
  unnest %>% 
  filter(!is.na(produced_by)) %>%
  rename(person = produced_by) %>%
  select(person, movie, type)

written_by_links <- lgbtq %>%
  select(written_by, movie) %>%
  mutate(written_by = str_split(written_by, ';'),
         type = 'wrote') %>%
  unnest %>%
  filter(!is.na(written_by)) %>%
  rename(person = written_by) %>%
  select(person, movie, type)

starring_links <- lgbtq %>%
  select(starring, movie) %>%
  rename(person = starring) %>%
  mutate(person = str_split(person, ';'),
         type = 'starred in') %>%
  unnest %>%
  filter(!is.na(person)) %>%
  select(person, movie, type)

music_links <- lgbtq %>%
  select(music_by, movie) %>%
  rename(person = music_by) %>%
  mutate(person = str_split(person, ';'),
       type = 'wrote music for') %>%
  unnest %>%
  filter(!is.na(person)) %>%
  select(person, movie, type)
  
cinematography_links <- lgbtq %>%
  select(cinematography, movie) %>%
  rename(person = cinematography) %>%
  mutate(person = str_split(person, ';'),
         type = 'did cinematics for') %>%
  unnest %>%
  filter(!is.na(person)) %>%
  select(person, movie, type)

edited_by_links <- lgbtq %>%
  select(edited_by, movie) %>%
  rename(person = edited_by) %>%
  mutate(person = str_split(person, ';'),
         type = 'edited') %>%
  unnest %>%
  filter(!is.na(person)) %>%
  select(person, movie, type)

people_edges <- ls()[ls() %>% str_detect('links')] %>%
  lapply(get) %>%
  bind_rows %>% 
  distinct %>% 
  mutate(person = person %>% str_replace_all('\\[.+\\]', '') %>% str_trim %>% sapply(function(x){str_c(x, ' (person)')})) %>%
  filter(!is.na(person))

word_edges <- lgbtq %>%
  select(movie, desc) %>%
  unnest_tokens(word, desc) %>%
  distinct() %>%
  group_by(word) %>%
  nest() %>%
  anti_join(stop_words) %>%
  unnest() %>%
  mutate(type = 'is text in') %>% 
  select(word, movie, type)


word_bigram <- lgbtq %>%
  select(desc) %>% 
  unnest_tokens(bigram, desc, token = 'ngrams', n =2) %>%
  separate(bigram, c('source', 'target'), sep = ' ') %>%
  group_by(source, target) %>%
  count(sort = T) %>%
  mutate(type = 'next') %>%
  rename(weight = n) %>%
  select(source, target, type, weight)
  
country_edges <- lgbtq %>%
  select(movie, country) %>%
  mutate(country = country %>% str_split(',|;')) %>%
  unnest %>%
  mutate(type = 'filmed in',
         country = str_c(country, ' (country)') %>% str_replace_all('\\[.+\\]', '') %>% str_trim) %>%
  select(movie, country, type) %>%
  filter(!is.na(country))

language_edges <- lgbtq %>%
  select(movie, language) %>%
  mutate(language = language %>% str_split(',|;')) %>%
  unnest %>%
  mutate(type = 'spoken in',
         language = language %>% str_replace_all('\\[.+\\]', '') %>% str_trim %>% str_c(' (language)')) %>%
  filter(!is.na(language))

edge_list <- ls()[ls() %>% str_detect('edges')] %>%
  lapply(function(x){
    some_edges <- x %>%
      get 
    names(some_edges) = c('source', 'target', 'type')
    some_edges
  }) %>%
  bind_rows()

edge_list <- list(edge_list %>% mutate(weight = 1 ), word_bigram) %>%
  bind_rows

movie_nodes <- lgbtq %>%
  select(movie, desc) %>%
  rename(label = movie) %>%
  mutate(type = 'movie',
         color = 'gold') %>%
  select(label, type, color, desc)

country_nodes <- country_edges %>%
  select(country) %>%
  distinct() %>%
  rename(label = country) %>%
  mutate(type = 'country',
         color = 'blue',
         desc = '')

language_nodes <- language_edges %>%
  select(language) %>%
  distinct %>%
  rename(label = language) %>%
  mutate(type = 'language',
         color = 'orange',
         desc = '')

people_nodes <- people_edges %>%
  select(person) %>%
  distinct() %>%
  rename(label = person) %>%
  mutate(type = 'person',
         color = 'purple',
         desc = '')

words <- c(word_edges$word, word_bigram$source, word_bigram) %>% unlist %>% unique
word_nodes <- tibble(label = words) %>%
  mutate(type = 'word',
         color = 'lightgrey',
         desc = '')

node_list <- ls()[ls() %>% str_detect('nodes')] %>%
  lapply(function(x){
    some_nodes <- x %>%
      get 
  }) %>% 
  bind_rows 

lgbtq_movie_net <- graph_from_data_frame(edge_list, T, node_list %>% distinct)

write_graph(lgbtq_movie_net, 'lgbtq_movie_network.graphml', 'graphml')
lgbtq_movie_net <- read_graph('lgbtq_movie_network.graphml', 'graphml')

reverse_induced_subgraph <- function(nodes, graph){
  induced_subgraph(graph = graph, vids = nodes)
}

reverse_subgraph_edges <- function(edges, graph, delete.vertices = F){
  subgraph.edges(graph = graph, eids = edges, delete.vertices = delete.vertices)
}

reverse_ego <- function(nodes, graph, order = 1, mode = 'all' ){
  ego(graph = graph, order = order, nodes = nodes, mode = mode) %>%
    unlist %>%
    names %>%
    unique
}

reverse_degree <- function(v, graph, mode = 'all'){
  degree(graph = graph, v = v, mode = mode)
}

save_graph_as <- function(graph, name){
  assign(name, graph, envir=globalenv())
  graph
}

trial <- lgbtq_movie_net %>%
  V() %>% 
  .[type == 'country'] %>%
  .[name %>% str_detect(regex('chile', ignore_case = T))] %>%
  reverse_ego(graph = lgbtq_movie_net, order = 2, mode = 'all') %>%
  reverse_induced_subgraph(graph = lgbtq_movie_net) %>%
  save_graph_as('test_graph') %>%
  E() %>%
  .[type == 'is text in'] %>%
  reverse_subgraph_edges(graph = test_graph) %>%
  degree()
  
horror_sentence <- lgbtq_movie_net %>%
  V() %>%
  .[type == 'word'] %>%
  .[name %>% str_detect(regex('horror|terror|scare', ignore_case = T))] %>%
  reverse_ego(graph = lgbtq_movie_net, order = 2, mode = 'all') %>%
  reverse_induced_subgraph(graph = lgbtq_movie_net) %>%
  save_graph_as('horror_graph') %>%
  E() %>%
  .[type == 'next'] %>%
  reverse_subgraph_edges(graph = horror_graph)

trial %>%
  V() %>%
  .[type == 'country']
