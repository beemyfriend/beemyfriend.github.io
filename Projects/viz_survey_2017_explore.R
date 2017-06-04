setwd('d://Websites/beemyfriend.github.io/Projects/')
library(tidyverse)
library(stringr)
survey <- read_csv('data_viz_survey_2017.csv')

names(survey)

survey$`How did you learn to create data visualization?` #factor
survey$`Which of these charts have you used in production in the last 6 months:` #need to split ';' DONE!!!
survey$`How many years have you been doing data visualization?` #numeric
survey$`How do you present your data visualizations?` #need to split ';' DONE!!!
survey$`What focus is data visualization in your work?`#factor
survey$`What technologies do you use to visualize data?` #need to split ';' DONE!!!
survey$`What knowledge level do they have of the data you are visualizing for them?` #need to split ';' 'DONE!!! 
survey$`Percent of your day focused on creating/implementing/productizing data visualizations?`  #double
survey$`Percent of your day focused on data engineering?` #double
survey$`Percent of your day focused on data prep work?` #double
survey$`Percent of your day focused on data science?` #double
survey$`Percent of your day focused on design?` #double
survey$`For your current role or the majority of your projects: were you hired to do data visualization only or is data visualization a part of your job/project description?` #filter for 'hired to do data visualization
survey$`What level of data visualizations are used at your organization?` # seperate ';'  DONE!!
survey$`How is your organization using data visualization?` #seperate ';' DONE!!!
survey$`Is there a separate group that does data visualizations or are you embedded in another group? (data science UX UI web data engineering IT etc)` #factor
survey$`Did you set out to work in data visualization or did you fall into it?` #factor
survey$`What's your employment status` #filter for Full-time
survey$`Data visualization roles at your organization are found in what part of the organization?` #split at ';' DONE!
survey$`Are you able to choose your own tools or are the choices made for you?` #factor
survey$`Who do you make data visualizations for?` #split at ';' DONE!!!
survey$`How often do they consume your data visualizations?` #factor
survey$`What do they use your data visualizations for?` #split at ';' DONE!!!
survey$`How would you describe the relationship?` # factor

project <- survey %>% select(`How did you learn to create data visualization?`, `Which of these charts have you used in production in the last 6 months:`, 
                  `How many years have you been doing data visualization?`, `How do you present your data visualizations?`, 
                  `What focus is data visualization in your work?`, `What technologies do you use to visualize data?`,
                  `What knowledge level do they have of the data you are visualizing for them?`,
                  `Percent of your day focused on creating/implementing/productizing data visualizations?`, `Percent of your day focused on data engineering?`,
                  `Percent of your day focused on data prep work?`, `Percent of your day focused on data science?`, `Percent of your day focused on design?`,
                  `For your current role or the majority of your projects: were you hired to do data visualization only or is data visualization a part of your job/project description?`,
                  `What level of data visualizations are used at your organization?`, `How is your organization using data visualization?`, 
                  `Is there a separate group that does data visualizations or are you embedded in another group? (data science UX UI web data engineering IT etc)`, 
                  `Did you set out to work in data visualization or did you fall into it?`, `What's your employment status`,
                  `Data visualization roles at your organization are found in what part of the organization?`, 
                  `Are you able to choose your own tools or are the choices made for you?`, `Who do you make data visualizations for?`, 
                  `How often do they consume your data visualizations?`, `What do they use your data visualizations for?`, `How would you describe the relationship?`) %>%
  filter(`What's your employment status` == 'Full-time' &  `For your current role or the majority of your projects: were you hired to do data visualization only or is data visualization a part of your job/project description?` == "Hired to do data visualization") %>%
  mutate(id = 1:nrow(.)) 

project$`Data visualization roles at your organization are found in what part of the organization?` <- project$`Data visualization roles at your organization are found in what part of the organization?` %>%
  str_replace('News|Specific department for news graphics|Editorial office|Editorial|editorial', 'Newsroom') %>%
  str_replace('Data Explorer|Algorithms', 'Data_Science') %>%
  str_replace('BI|Analysis|sales|Finance', 'Analytics') %>%
  str_replace('just me;my own department|org is small|my company is a pure data visualization player|Founders|Executive', 'Everywhere') %>%
  str_replace('Visuals', 'Other')

departments <- c('Design', 'Engineering', 'Research', 'Marketing', 'IT', 'Newsroom', 'Analytics', 'Data_Science', 'Everywhere', 'Other')

for(i in 1:length(departments)){
  project[[str_c('department_',departments[i])]] <- str_detect(project$`Data visualization roles at your organization are found in what part of the organization?`, departments[i])
}

project <- project %>% select(-`Data visualization roles at your organization are found in what part of the organization?`)

project$`Who do you make data visualizations for?` <- project$`Who do you make data visualizations for?` %>%
  str_replace('Newsrooms|General Public', 'GP') %>%
  str_replace('Medical Professionals', 'MP') %>%
  str_replace('Product Managers|Project Managers', 'PM') %>%
  str_replace('clients for sales team', 'Clients')

audience <- c('GP', 'Engineers', 'Scientists', 'MP', 'PM', 'Executives', 'Analysts', 'Clients')

for(i in 1:length(audience)){
  project[[str_c('audience_', audience[i])]] <- str_detect(project$`Who do you make data visualizations for?`, audience[i])
}

project <- project %>% select(-`Who do you make data visualizations for?`)

audience_usage <- c('Summarization', 'Learning', 'Research', 'Analysis', 'Entertainment', 'DM', 'News')

project$`What do they use your data visualizations for?` <- project$`What do they use your data visualizations for?` %>%
  str_replace('news|Publication', 'News') %>%
  str_replace('decision making|decisionmaking|Decision-making', 'DM')

for(i in 1:length(audience_usage)){
  project[[str_c('audience_usage_', audience_usage[i])]] <- str_detect(project$`What do they use your data visualizations for?`, audience_usage[i])
}

project <- project %>% select(-`What do they use your data visualizations for?`)


org_usage <- c('Analysis', 'ML', 'SO', 'Communication', 'Exploration', 'Marketing', 'News');

project$`How is your organization using data visualization?` <- project$`How is your organization using data visualization?` %>%
  str_replace('Summary/Overview', 'SO') %>%
  str_replace('Machine Learning', 'ML') %>%
  str_replace('Editorial|Storytelling|Journalism', 'News')

for(i in 1:length(org_usage)){
  project[[str_c('org_usage_', org_usage[i])]] <- str_detect(project$`How is your organization using data visualization?`, org_usage[i])
}

project <- project %>% select(-`How is your organization using data visualization?`)

org_level <- c('Custom', 'BI', 'RPy', 'GCL')

project$`What level of data visualizations are used at your organization?` <- project$`What level of data visualizations are used at your organization?` %>%
  str_replace('Completely custom', 'Custom') %>%
  str_replace('Business Intelligence Tools', 'BI') %>%
  str_replace('ggplot2/Pandas Charts', 'RPy') %>%
  str_replace('General charting libraries', 'GCL');

for(i in 1:length(org_level)){
  project[[str_c('org_level_', org_level[i])]] <- str_detect(project$`What level of data visualizations are used at your organization?`, org_level[i])
}

project <- project %>% select(-`What level of data visualizations are used at your organization?`)

audience_literacy <- c('Intro', 'Moderate', 'Expert')

for(i in 1:length(audience_literacy)){
  project[[str_c('audience_literacy_', audience_literacy[i])]] <- str_detect(project$`What knowledge level do they have of the data you are visualizing for them?`, audience_literacy[i])
}

project <- project %>% select(-`What knowledge level do they have of the data you are visualizing for them?`)

project$`What technologies do you use to visualize data?`

tech <- c('Illustrator', 'Excel', 'D3', 'Processing', 'OR', 'OP', 'OG', 'ON', 'React', 'OJ', 'ggplot', 'Pandas', 'Angular', 'Vega', 'Gephi', 'Leaflet',
          'Mapbox', 'Plotly', 'WebGL', 'QGIS', 'TGS', 'Highcharts', 'Qlik', 'Java', 'Tableau', 'ArcGIS', 'PBI', 'OBI', 'OMVC', 'PostGIS', 'Postgres',
          'DGL', 'Microstrategy', 'Recharts', 'nodebox', 'PP')

project$`What technologies do you use to visualize data?` <- project$`What technologies do you use to visualize data?` %>%
  str_replace('Other R', 'OR') %>%
  str_replace('Other Python', 'OP') %>%
  str_replace('Other GIS', 'OG') %>%
  str_replace('Other Network Visualization Suite', 'ON') %>%
  str_replace('Three.js', 'TJS') %>%
  str_replace('Other Javascript', 'OJ') %>%
  str_replace('Power BI', 'PBI') %>%
  str_replace('Other BI', 'OBI') %>%
  str_replace('Other MVC', 'OMVC') %>%
  str_replace('deck.gl', 'DGL') %>%
  str_replace('pen & paper', 'PP')

for(i in 1:length(tech)){
  project[[str_c('tech_', tech[i])]] <- str_detect(project$`What technologies do you use to visualize data?`, tech[i]);
}

project <- project %>% select(-`What technologies do you use to visualize data?`)

project$`How do you present your data visualizations?`

presentation <- c('Tool', 'Dashboard', 'Scrollytelling', 'WP', 'Documents', 'Presentations', 'Email', 'Print')

project$`How do you present your data visualizations?` <- project$`How do you present your data visualizations?` %>%
  str_replace('Embedded in a tool', 'Tool') %>%
  str_replace('Static Web Page|CMS|web apps|Web application|not static|Dynamic web pages', 'WP') %>%
  str_replace('Printed version|Research papers|static mockups', 'Print')

for(i in 1:length(presentation)){
  project[[str_c('presentation_', presentation[i])]] <- str_detect(project$`How do you present your data visualizations?`, presentation[i])
}

project <- project %>% select(-`How do you present your data visualizations?`)


charts <- c('LC', 'BC', 'Infographics', 'Treemap', 'ND', 'CM', 'RM', 'FD', 'VRAR', 'DT', 'PC', 'Dendrogram', 'VM', 'TDC', 'TM', 'SP', 'SG', 'Custom', 'HM', 'Other')

project$`Which of these charts have you used in production in the last 6 months:` <- project$`Which of these charts have you used in production in the last 6 months:` %>%
  str_replace('Line Chart', 'LC') %>%
  str_replace('Bar Chart', 'BC') %>%
  str_replace('Network Diagram|Graph', 'ND') %>%
  str_replace('Choropleth Map', 'CM') %>%
  str_replace('Raster Map', 'RM') %>%
  str_replace('Flow Diagram', 'FD') %>%
  str_replace('VR/AR Charting', 'VRAR') %>%
  str_replace('Delaunay Triangulation', 'DT') %>%
  str_replace('Pie Chart', 'PC') %>%
  str_replace('3D Chart', 'TDC') %>%
  str_replace('Vector Map', 'VM') %>%
  str_replace('Topographical Maps', 'TM') %>%
  str_replace('scatterplot|scatter|Scatterplot|bubble|Scatter plot', 'SP') %>%
  str_replace('Streamgraph|streamgraph', 'SG') %>%
  str_replace('heatmaps|Heatmap| Heat Map|heat map', 'HM') %>%
  str_replace('custom', 'Custom') %>%
  str_replace('other|timelines|cartogram|Icicle|radial|different kinds|Gantt|matrix|path plot|boxplot|bump|dumbbell', 'Other')

for(i in 1:length(charts)){
  project[[str_c('charts_', charts[i])]] <- str_detect(project$`Which of these charts have you used in production in the last 6 months:`, charts[i])
}

project <- project %>% select(-`Which of these charts have you used in production in the last 6 months:`)
