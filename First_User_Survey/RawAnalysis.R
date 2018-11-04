# Analyse surevey results form SurveyMonkey Initial Useage Survey
# at: hyperlink

require(tidyverse)
require(readxl)

dataDrive<-"D:"
dataDir<-"SWMP_Stuff/Individual"
df <- read_xlsx(paste(dataDrive,dataDir,"Excel/SWMP Status Report Initial Use.xlsx",sep = "/"))
#head(df)
df <- (df[-1,])
df <- df[-c(2:9,12,14,16,18:20)]
var_names <- c("ID","Sector","Used_Report","Updated_Report","Software_Rating","Process_Rating" )

names(df) <- var_names
for(i in 1:6) {
  df[i] <- as.factor(df[i])
  }
levels(df$Sector)
df
