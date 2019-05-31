# Analyse surevey results form SurveyMonkey Initial Useage Survey
# at: hyperlink

require(tidyverse)
require(readxl)

dataDrive<-"C:"
#dataDir<-"SWMP_Stuff/Individual"
dataDir<-"Users/davee/Documents/GitHub/SWMP_Status_Report/First_User_Survey"
#df <- read_xlsx(paste(dataDrive,dataDir,"Excel/SWMP Status Report Initial Use.xlsx",sep = "/"))
df <- read.csv(paste(dataDrive,dataDir,"CSV/SWMP Status Report Initial Use.csv",sep = "/"), stringsAsFactors = TRUE, sep =",")
#head(df)
df <- (df[-1,])
df <- df[-c(2:9,12,14,16,18:20)]
var_names <- c("ID","Sector","Used_Report","Updated_Report","Software_Rating","Process_Rating" )
names(df) <- var_names
lvl <- levels(df$Software_Rating)
lvlOrdered <- lvl[c(5,2,4,3)]
lvlOrdered[5] <- "It was too hard, I gave up."
df$SoftOrered <- factor(df$Software_Rating, levels = lvlOrdered)
lvl <- levels(df$Process_Rating)
lvlOrdered[5] <- "It was too hard, I gave up."
lvlOrdered <- lvl[c(5,2,3,4)]

df$ProcessOrdered <- factor(df$Process_Rating, levels = lvlOrdered)
#table(df$Sector)
df$Sector <- recode(df$Sector, "Research Coordinators" = "RCs", 
       "SWMP Technicians" = "SWMP Techs",
       "Education Coordinators" = "ECs",
       "Coastal Training Program Coordinators" = "CTPCs",
       "Stewardship Coordinator" = "SCs")
df %>%
  ggplot(aes(factor(Sector))) %>%
  + geom_bar(aes(fill = factor(Used_Report)))

df %>%
  #  group_by(Sector) %>%
  ggplot(aes(factor(Sector))) %>%
  + geom_bar(aes(fill = factor(Updated_Report)))

numUsed <- df %>%
  filter(Used_Report == "Yes") %>%
  count()

numUpdated <- df %>%
  filter(Updated_Report == "Yes") %>%
  count()
numUpdated

updateNoUse <-  df %>%
  filter(Used_Report == "No" & Updated_Report == "Yes") 

useNoUpdate <-  df %>%
  filter(Used_Report == "Yes" & Updated_Report == "No") 

useAndUpdate <-  df %>%
  filter(Used_Report == "Yes" & Updated_Report == "Yes") 


df %>%
  filter(Updated_Report == "Yes") %>%
  ggplot(aes(factor(Sector))) %>%
  + geom_bar(aes(fill = factor(ProcessOrdered)))

df %>%
  filter(Updated_Report == "Yes") %>%
  ggplot(aes(factor(Sector))) %>%
  + geom_bar(aes(fill = factor(SoftOrered)))
             

