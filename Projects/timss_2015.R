setwd('d://TIMSS/2015_TIMSS/TIMSS/Grade 08/Y2015/')
library(tidyverse)
library(stringr)

library(haven)

library(readxl)

ach_table <- read_excel('Documents/t15_g8_iteminformation.xlsx') %>%
  select(`Item ID`, `Content Domain`, `Cognitive Domain`,`Topic Area`, Key, Label) %>%
  mutate(question_type = sapply(Key, function(x){
    if(str_detect(x, '-')){
      'Free Response'
    } else {
      'Multiple Choice'
    }})) %>%
  mutate(Key = sapply(Key, function(x){
    if(x == 'A'){
      1
    } else if ( x == 'B'){
      2
    } else if (x == 'C'){
      3
    } else if (x == 'D'){
      4
    } else {
      x
    }
  }))

names(ach_table) <- c('question', 'content_domain', 'cognitive_domain', 'topic_area',
                      'key', 'label','question_type')


grab_math_questions <- function(spss){
  read_spss(spss) %>%
    select_(.dots = names(.)[str_detect(names(.), '^M|IDBOOK|IDSCHOOL|IDSTUD|ITSEX|^BSM')]) %>%
    gather_('question', 'answer', names(.)[str_detect(names(.), '^M')]) %>%
    filter(!is.na(answer))
}

get_book_info <- function(df){
  df %>%
    group_by(IDBOOK) %>%
    nest() %>%
    mutate(
      students_per_book = sapply(seq_along(.$data), function(i){
        .$data[[i]] %>%
          group_by(IDSTUD) %>%
          count() %>%
          nrow()
      })) %>%
    mutate(
      students_per_book_female = sapply(seq_along(.$data), function(i){
        .$data[[i]] %>%
          group_by(IDSTUD, ITSEX) %>%
          count() %>%
          filter(ITSEX == 1) %>%
          nrow()})) %>%
    mutate(
      students_per_book_male = sapply(seq_along(.$data), function(i){
        .$data[[i]] %>%
          group_by(IDSTUD, ITSEX) %>%
          count() %>%
          filter(ITSEX == 2) %>%
          nrow()})) %>%
    unnest()
}


combine_datasets <- function(df, codebook){
  df %>%
    left_join(codebook) %>%
    mutate(
      student_gave_correct_answer = sapply(seq_along(.$key), function(i){
        if(.$key[i] %in% 1:4){
          .$key[i] == .$answer[i]
        } else {
          str_detect(.$answer[i], '^[12]')
        }}))
}

get_question_info <- function(df){
  df %>%
    group_by(question)%>%
    nest() %>%
    mutate(
      students_per_question = sapply(seq_along(.$data), function(i){
        .$data[[i]] %>%
          group_by(IDBOOK, students_per_book) %>%
          count() %>%
          .$students_per_book %>%
          sum()
      })) %>%
    mutate(
      students_per_question_female = sapply(seq_along(.$data), function(i){
        .$data[[i]] %>%
          group_by(IDBOOK, students_per_book_female) %>%
          count() %>%
          .$students_per_book_female %>%
          sum()})) %>%
    mutate(
      students_per_question_male = sapply(seq_along(.$data), function(i){
        .$data[[i]] %>%
          group_by(IDBOOK, students_per_book_male) %>%
          count() %>%
          .$students_per_book_male %>%
          sum()})) %>%
    mutate(
      correct_ratio_per_question = sapply(seq_along(.$data), function(i){
        tot_students = .$students_per_question[i]
        .$data[[i]] %>%
          filter(student_gave_correct_answer) %>%
          nrow()/tot_students})) %>%
    mutate(
      correct_ratio_per_question_female = sapply(seq_along(.$data), function(i){
        tot_female = .$students_per_question_female[i]
        .$data[[i]] %>%
          filter(student_gave_correct_answer, ITSEX == 1) %>%
          nrow()/tot_female})) %>%
    mutate(
      correct_ratio_per_question_male = sapply(seq_along(.$data), function(i){
        tot_male = .$students_per_question_male[i]
        .$data[[i]] %>%
          filter(student_gave_correct_answer, ITSEX == 2) %>%
          nrow()/tot_male})) %>%
    unnest()
}

graph_setup <- function(math_df){
  math_df %>%
    group_by(question, students_per_question, students_per_question_female,
             students_per_question_male, correct_ratio_per_question,
             correct_ratio_per_question_female, correct_ratio_per_question_male,
             content_domain, cognitive_domain, topic_area, question_type, 
             country) %>%
    nest() %>%
    arrange(desc(correct_ratio_per_question)) %>%
    mutate(question_rank = 1:nrow(.)) %>%
    mutate(diff_male_female = correct_ratio_per_question_male - correct_ratio_per_question_female) %>%
    mutate(dominant_gender = sapply(.$diff_male_female, function(x){
      if(x > 0){
        'Male'
      } else if (x < 0){
        'Female'
      } else {
        'Tie'
      }})) %>%
    select(-data)
}

clean_math <- function(file_location, codebook, country){
    grab_math_questions(file_location) %>%
    get_book_info() %>%
    combine_datasets(codebook) %>%
    get_question_info() %>%
    mutate(country = country)  %>%
    graph_setup()
  }


files_2015 <- dir('Data/SPSS/') 

countries_2015 <- files_2015 %>%
  str_replace('bsa', '') %>%
  str_replace('m6.sav', '')

files_2011 <- dir('../../../../2011/2011_math_timss/TIMSS/Grade 08/Y2011/Data/SPSS/')

countries_2011 <- files_2011 %>%
  str_replace('bsa', '') %>%
  str_replace('m5.sav', '')

countries_both <- countries_2015[countries_2015 %in% countries_2011]

search_files <- 
  files_2015[str_detect(files_2015, str_c(countries_both, collapse = '|'))]

for(i in search_files){
  country = i %>%
    str_replace_all('bsa|m6.sav', '')
  
#  new_var = str_c(country, '_2015')
  new_location = str_c('new_data/', country, '_TIMSS_QUESTIONS.tsv')
  
  file_location = str_c('Data/SPSS/', i)
  
  trial <- clean_math(file_location, ach_table, country) %>%
    select(question, 
           correct_ratio_per_question, 
           content_domain, 
           cognitive_domain, 
           topic_area, 
           question_type, 
           diff_male_female)
  
#  assign(new_var, clean_math(file_location, ach_table, country)) 
  write_tsv(trial, new_location)
  rm(trial)
  gc()
}

all_countries_2015 <- ls() %>%
  str_subset('^\\w\\w\\w_2015$')

timss_2015_math <- data.frame()

for(i in all_countries_2015){
  timss_2015_math <- rbind(timss_2015_math, get(i))
}

timss_2015_math <- timss_2015_math %>%
  group_by(country) %>%
  nest() %>%
  mutate(
    country_mean_correct_ratio = sapply(seq_along(.$data), function(i){
      .$data[[i]] %>%
        .$correct_ratio_per_question %>%
        mean()})) %>%
  arrange(desc(country_mean_correct_ratio)) %>%
  mutate(international_rank = 1:nrow(.)) %>%
  unnest() %>%
  arrange(international_rank, question_rank)
  
question_key <- ach_table %>% select(question, label)

timss_2015_math <- timss_2015_math %>% left_join(question_key)

write.csv2(timss_2015_math, 'new_data/TIMSS_2015_ALL_MATH.csv2')
write_tsv(timss_2015_math, 'new_data/TIMSS_2015_ALL_MATH.tsv')
timss_2015_math$country <- timss_2015_math$country %>% 
  factor(
    levels = timss_2015_math$country %>%unique()
    )

country_abr <- levels(timss_2015_math$country)

country_json <- function(country){
  timss_2015_math %>%
    filter(country == country) %>%
    jsonlite::toJSON()
}

for(i in country_abr){
  assign(str_c(i, '_math_json'), country_json(i))  
}

all_json <- str_c(country_abr, '_math_json')

combine_json <- "{"

country_object <- function(json){
  str_c('"', str_replace(json, '_math_json',''), '"', ':', get(json))
}

for(i in all_json){
  if(i == all_json[length(all_json)]){
    combine_json <- str_c(combine_json, country_object(i), '}')
  } else {
    combine_json <- str_c(combine_json, country_object(i), ',')  
  }
}

write(combine_json, 'new_data/TIMSS_2015_ALL_MATH.json')
