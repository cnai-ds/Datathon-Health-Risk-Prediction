# retrieve Mortality data 1999-2000 
srvyin <- paste("/home/dell/Documentos/TensorFlow/SCOR Challenge/rCodeSample/Mortality Data/NHANES_1999_2000_MORT_2015_PUBLIC.dat")   # full .DAT name here 
srvyout <- "NHANES_1999_2000" # shorthand dataset name here 
source("./0_R_ReadInProgramAllSurveys_2015.R") 
 
 
# retrieve Mortality data 2000-2001 
srvyin <- paste("/home/dell/Documentos/TensorFlow/SCOR Challenge/rCodeSample/Mortality Data/NHANES_2001_2002_MORT_2015_PUBLIC.dat")   # full .DAT name here 
srvyout <- "NHANES_2001_2002" # shorthand dataset name here 
source("./0_R_ReadInProgramAllSurveys_2015.R") 
 
 
# retrieve Mortality data 2002-2003 
srvyin <- paste("/home/dell/Documentos/TensorFlow/SCOR Challenge/rCodeSample/Mortality Data/NHANES_2003_2004_MORT_2015_PUBLIC.dat")   # full .DAT name here 
srvyout <- "NHANES_2003_2004" # shorthand dataset name here 
source("./0_R_ReadInProgramAllSurveys_2015.R") 
 
 
# etc ... 
 
 
# Aggregate all the filghts 
 
Mortality_NHANES<-rbind(NHANES_1999_2000,NHANES_2001_2002,NHANES_2003_2004) 
rm(NHANES_1999_2000,NHANES_2001_2002,NHANES_2003_2004) 
 
 
# recode categorical variables 
 
Mortality_NHANES[Mortality_NHANES$mortstat%in%0,]$mortstat<-"Assumed Alive" 
Mortality_NHANES[Mortality_NHANES$mortstat%in%1,]$mortstat<-"Assumed Dead" 
Mortality_NHANES$mortstat<-as.factor(Mortality_NHANES$mortstat) 
Mortality_NHANES[Mortality_NHANES$eligstat%in%1,]$eligstat<-"Eligible" 
Mortality_NHANES[Mortality_NHANES$eligstat%in%2,]$eligstat<-"Under age 18, not available for release" 
Mortality_NHANES[Mortality_NHANES$eligstat%in%3,]$eligstat<-"Ineligible" 
Mortality_NHANES$eligstat<-as.factor(Mortality_NHANES$eligstat) 
Mortality_NHANES[Mortality_NHANES$diabetes%in%0,]$diabetes<-"No" 
Mortality_NHANES[Mortality_NHANES$diabetes%in%1,]$diabetes<-"Yes" 
Mortality_NHANES$diabetes<-as.factor(Mortality_NHANES$diabetes) 
Mortality_NHANES[Mortality_NHANES$hyperten%in%0,]$hyperten<-"No" 
Mortality_NHANES[Mortality_NHANES$hyperten%in%1,]$hyperten<-"Yes" 
Mortality_NHANES$hyperten<-as.factor(Mortality_NHANES$hyperten) 
Mortality_NHANES[Mortality_NHANES$ucod_leading%in%1,]$ucod_leading<-"Disease of heart" 
Mortality_NHANES[Mortality_NHANES$ucod_leading%in%2,]$ucod_leading<-"Malignant neoplasm" 
Mortality_NHANES[Mortality_NHANES$ucod_leading%in%3,]$ucod_leading<-"Chronic lower respiratory diseases" 
Mortality_NHANES[Mortality_NHANES$ucod_leading%in%4,]$ucod_leading<-"Accidents (unintentional injuries)" 
Mortality_NHANES[Mortality_NHANES$ucod_leading%in%5,]$ucod_leading<-"Cerebrovascular diseases" 
Mortality_NHANES[Mortality_NHANES$ucod_leading%in%6,]$ucod_leading<-"Alzheimer's disease" 
Mortality_NHANES[Mortality_NHANES$ucod_leading%in%7,]$ucod_leading<-"Diabetes mellitus" 
Mortality_NHANES[Mortality_NHANES$ucod_leading%in%8,]$ucod_leading<-"Influenza and pneumonia" 
Mortality_NHANES[Mortality_NHANES$ucod_leading%in%9,]$ucod_leading<-"Nephritis, nephrotic syndrome and nephrosis" 
Mortality_NHANES[Mortality_NHANES$ucod_leading%in%10,]$ucod_leading<-"All other causes (residual)" 
Mortality_NHANES$ucod_leading<-as.factor(Mortality_NHANES$ucod_leading) 

write.csv(Mortality_NHANES, file = "Mortality_NHANES.csv")
 
#summary(Mortality_NHANES) 
 