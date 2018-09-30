setwd('NCSC_Workspace/')
library(tidyverse)
library(readxl)

hackSheets <- readxl::excel_sheets('Vizathon-Data.xlsx')
hackData <- map(hackSheets, function(x){
  read_excel('Vizathon-Data.xlsx', sheet = x)
})
names(hackData) <- hackSheets

map(hackData, names)

nestedCourtData <- hackData$USState %>%
  select(USStateID, USStateName) %>%
  left_join(hackData$USStateCourt) %>%
  left_join(select(hackData$Court, -DisplayOrder)) %>%
  left_join(select(hackData$Funding, FundingID, FundingDescription)) %>%
  select(-FundingID) %>%
  mutate(CourtID = str_c("CourtID_", CourtID)) %>%
  left_join(select(hackData$AppealProcess, -AppealProcessID) %>%
              mutate_all(function(x) str_c("CourtID_", x)) %>%
              mutate(Child = ChildCourtID,
                     Parent = ParentCourtID) %>%
              group_by(ChildCourtID) %>%
              nest(.key = 'ParentCourts'), 
            by=c('CourtID' = 'ChildCourtID')) %>%
  left_join(
    hackData$CourtCaseType %>%
      left_join(select(hackData$CaseType, -DisplayOrder)) %>%
      select(-CourtCaseTypeID, -CaseTypeID, -DisplayOrder) %>%
      mutate(CourtID = str_c("CourtID_", CourtID)) %>%
      group_by(CourtID) %>% 
      nest(.key = 'CaseTypes')) %>%
  filter(!is.na(CourtLevelID)) %>%
  mutate(CourtName = str_split(CourtName, ' ')) %>%
  group_by(USStateID, USStateName) %>%
  nest(.key = 'Courts') %>%
  mutate(ChildParent = map(Courts, function(x) select(bind_rows(x$ParentCourts), -ParentCourtID)))

nestedCourtDataJSON <- jsonlite::toJSON(nestedCourtData)
write(nestedCourtDataJSON, "nestedCourtData.json")
write(str_c('data = ', nestedCourtDataJSON), 'nestedCourtData.js')

courtTypes <- nestedCourtData %>% unnest() %>% .$CourtLevelID %>% unique

courtTypesJSON <- jsonlite::toJSON(courtTypes)
write(courtTypesJSON, 'courtTypes.json')







nestedCourtData %>% filter(is.na(CourtName))

nestedCourtData %>% filter(USStateName %in% c("Oklahoma", "Texas"))

hackData$Court %>%
  left_join(hackData$CourtCourtName) %>%
  filter(CourtID == 93) %>%
  select(CourtID, CourtName, CourtCourtNameID, CourtNameID ) %>%
  left_join(hackData$CourtName) %>%
  select(-PanelDecisionID, -NumberPanels, -NumberOfIndividualCourts, -CaseManagementID)
