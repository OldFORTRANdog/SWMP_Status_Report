# Analyse surevey results form SurveyMonkey Initial Useage Survey
# at: hyperlink

require(tidyverse)
require(readxl)

dataDir<-"L:/SWMP_Stuff/Individual/CSV"
datFile <- read.csv2(paste(dataDir,"SWMP Status Report Initial Use.csv",sep = "/"),header = TRUE,sep = ",")

dataDir<-"L:/SWMP_Stuff/Individual/Excel"
datXFile <- read_xlsx(paste(dataDir,"SWMP Status Report Initial UseMOD.xlsx",sep = "/"))
summarise(datFile)
df <- tibble(datXFile)
