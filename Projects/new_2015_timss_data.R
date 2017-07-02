library(tidyverse)
library(stringr)
setwd('d://Websites/beemyfriend.github.io/Projects/')
timss_2015 <- read_tsv('TIMSS_2015_NO_BM.tsv')
names(timss_2015)

n_bins = 25

timss_2015 <- timss_2015 %>% 
  select(-c(country_mean_correct_ratio, students_per_question, students_per_question_female, students_per_question_male,
            dominant_gender))

timss_2015 <- timss_2015 %>%
  mutate(gender_bins = cut(diff_male_female, n_bins))
  
x <- timss_2015 %>%
  group_by(country, gender_bins) %>%
  nest

for(i in 1:nrow(x)){
  x$data[[i]] = x$data[[i]] %>% arrange(correct_ratio_per_question)
  x$data[[i]]$gender_bins_order = 1:nrow(x$data[[i]])
}

x <- x %>% unnest()

x <- x %>% 
  group_by(country, correct_ratio_per_question_range) %>%
  nest

for(i in 1:nrow(x)){
  x$data[[i]] = x$data[[i]] %>% arrange(diff_male_female)
  x$data[[i]]$correct_ratio_per_question_range_order = 1:nrow(x$data[[i]])
}

x <- x %>% unnest()

write_tsv(x, 'TIMSS_Dashboard_data.tsv')


#=====================================#
#----- small multiples domain --------#
#=====================================#

sm_domain<- x %>% group_by(country, content_domain, cognitive_domain) %>%
  nest() %>%
  mutate(mean_success_rate = sapply(seq_along(.$data), function(i){
    .$data[[i]]$correct_ratio_per_question %>% mean()
  })) %>%
  mutate(mean_rank = sapply(seq_along(.$data), function(i){
    .$data[[i]]$question_rank %>% mean()
  }))

write_tsv(sm_domain %>% select(-data), 'small_multiple_domains.tsv')

#=====================================#
#----- small multiples domain --------#
#=====================================#

sm_hist_correct <- x %>%
  mutate(correct_bins = cut(correct_ratio_per_question, n_bins)) %>%
  group_by(country, correct_bins) %>%
  nest() %>%
  mutate(
    correct_bins_lead = correct_bins %>%
      str_extract('\\-?\\d.\\d+') %>%
      as.numeric()) %>%
  mutate(
    correct_count = sapply(seq_along(1:nrow(.)), function(i){
      .$data[[i]] %>% nrow()
    })
  ) 

sm_hist_gender <- x %>%
  group_by(country, gender_bins) %>%
  nest() %>%
  mutate(
    gender_bins_lead = gender_bins %>%
      str_extract('\\-?\\d.\\d+') %>%
      as.numeric()) %>%
  mutate(
    gender_count = sapply(seq_along(1:nrow(.)), function(i){
      .$data[[i]] %>% nrow()
    })
  )

correct_bins <- sm_hist_correct %>% arrange(correct_bins_lead) %>% .$correct_bins %>% unique()
gender_bins <- sm_hist_gender %>% arrange(desc(gender_bins_lead)) %>% .$gender_bins %>% unique()
hist_bins <- data.frame(correct_bins, gender_bins)


write_tsv(sm_hist_correct %>% select(-data), 'small_multiples_correct_hist.tsv')
write_tsv(sm_hist_gender %>% select(-data), 'small_multiples_gender_hist.tsv')
write_tsv(hist_bins, 'hist_bins.tsv')  



question_ids <- timss_2015 %>%
  select(question, cognitive_domain, content_domain)%>%
  unique

write_tsv(question_ids, 'question_ids.tsv')

x <- read_tsv('TIMSS_Dashboard_data.tsv')

gender_bins <- x$gender_bins %>% as.factor() %>% levels()

x$gender_bins_lead <- x$gender_bins %>% 
  str_extract('\\-?\\d\\.\\d+') %>% 
  as.numeric()

x %>% arrange(gender_bins_lead)

write_tsv(x, 'TIMSS_Dashboard_data.tsv')
