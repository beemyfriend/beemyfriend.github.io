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
  }),
  mTitle = sapply(mTitle, function(x){str_c(x, ' (movie)')}))

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
  select(directed_by, mTitle) %>%
  mutate(directed_by = str_split(directed_by, ';'),
         type = 'directed') %>%
  unnest %>% 
  filter(!is.na(directed_by)) %>%
  rename(movie = mTitle,
         person = directed_by) %>%
  select(person, movie, type)

produced_by_links <- lgbtq%>%
  select(produced_by, mTitle) %>%
  mutate(produced_by = str_split(produced_by, ';'),
         type = 'produced') %>%
  unnest %>% 
  filter(!is.na(produced_by)) %>%
  rename(movie = mTitle,
         person = produced_by) %>%
  select(person, movie, type)

written_by_links <- lgbtq %>%
  select(written_by, mTitle) %>%
  mutate(written_by = str_split(written_by, ';'),
         type = 'wrote') %>%
  unnest %>%
  filter(!is.na(written_by)) %>%
  rename(movie = mTitle,
         person = written_by) %>%
  select(person, movie, type)

starring_links <- lgbtq %>%
  select(starring, mTitle) %>%
  rename(movie = mTitle,
         person = starring) %>%
  mutate(person = str_split(person, ';'),
         type = 'starred in') %>%
  unnest %>%
  filter(!is.na(person)) %>%
  select(person, movie, type)

music_links <- lgbtq %>%
  select(music_by, mTitle) %>%
  rename(movie = mTitle,
         person = music_by) %>%
  mutate(person = str_split(person, ';'),
       type = 'wrote music for') %>%
  unnest %>%
  filter(!is.na(person)) %>%
  select(person, movie, type)
  
cinematography_links <- lgbtq %>%
  select(cinematography, mTitle) %>%
  rename(movie = mTitle,
         person = cinematography) %>%
  mutate(person = str_split(person, ';'),
         type = 'did cinematics for') %>%
  unnest %>%
  filter(!is.na(person)) %>%
  select(person, movie, type)

edited_by_links <- lgbtq %>%
  select(edited_by, mTitle) %>%
  rename(movie = mTitle,
         person = edited_by) %>%
  mutate(person = str_split(person, ';'),
         type = 'edited') %>%
  unnest %>%
  filter(!is.na(person)) %>%
  select(person, movie, type)

people_edges <- ls()[ls() %>% str_detect('links')] %>%
  lapply(get) %>%
  bind_rows %>% 
  distinct %>% 
  mutate(person = person %>% sapply(function(x){str_c(x, ' (person)')})) %>%
  filter(!is.na(person))

word_edges <- lgbtq %>%
  select(mTitle, desc) %>%
  mutate(desc = str_c(mTitle %>% str_replace(' (movie)', ''), desc, sep = ' ')) %>%
  unnest_tokens(word, desc) %>%
  distinct() %>%
  group_by(word) %>%
  nest() %>%
  anti_join(stop_words) %>%
  unnest() %>%
  rename(movie = mTitle) %>%
  mutate(type = 'is text in') %>% 
  select(word, movie, type)

country_edges <- lgbtq %>%
  select(mTitle, country) %>%
  mutate(country = country %>% str_split(',|;')) %>%
  unnest %>%
  rename(movie = mTitle) %>%
  mutate(type = 'filmed in',
         country = str_c(country, ' (country)')) %>%
  select(movie, country, type) %>%
  filter(!is.na(country))

language_edges <- lgbtq %>%
  select(mTitle, language) %>%
  mutate(language = language %>% str_split(',|;')) %>%
  unnest %>%
  rename(movie = mTitle) %>%
  mutate(type = 'spoken in',
         language = str_c(language, ' (language)')) %>%
  filter(!is.na(language))

edge_list <- ls()[ls() %>% str_detect('edges')] %>%
  lapply(function(x){
    some_edges <- x %>%
      get 
    names(some_edges) = c('source', 'target', 'type')
    some_edges
  }) %>%
  bind_rows()

movie_nodes <- lgbtq %>%
  select(mTitle, desc) %>%
  rename(label = mTitle) %>%
  mutate(type = 'movie',
         color = 'gold') %>%
  group_by(label, type, color) %>%
  nest()

country_nodes <- country_edges %>%
  select(country) %>%
  distinct() %>%
  rename(label = country) %>%
  mutate(type = 'country',
         color = 'blue',
         data = vector('list', nrow(.)))

language_nodes <- language_edges %>%
  select(language) %>%
  distinct %>%
  rename(label = language) %>%
  mutate(type = 'language',
         color = 'orange',
         data = vector('list', nrow(.)))

people_nodes <- people_edges %>%
  select(person) %>%
  distinct() %>%
  rename(label = person) %>%
  mutate(type = 'person',
         color = 'purple',
         data = vector('list', nrow(.)))

word_nodes <- word_edges %>%
  select(word) %>%
  distinct() %>%
  rename(label = word) %>%
  mutate(type = 'word',
         color = 'lightgrey',
         data = vector('list', nrow(.)))
