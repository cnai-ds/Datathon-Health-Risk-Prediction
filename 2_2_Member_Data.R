#install.packages("SASxport")
#install.packages("xml2")
#install.packages("dplyr")
#install.packages("rvest")
#install.packages("data.table")
library(SASxport) 
library(xml2) 
library(dplyr) 
library(rvest) 
library(data.table) 
 
# Call function to recode vaiables from the html description downloaded 
source("./2_Recode_variables.R") 
 
 
# Export demographic data for the first 3 flights 
# Export html description and use it to recode variables accordingly 
 
DEMO_1999_2000 <- read.xport("./Member Data/1999_2000/Demographics/DEMO.XPT")
write.csv(DEMO_1999_2000, file = "DEMO_1999_2000.csv")
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/DEMO.htm", "./Member Data/1999_2000/Demographics/DEMO.htm", method='auto', mode='wb') 
htm_DEMO_1999_2000<-read_html("./Member Data/1999_2000/Demographics/DEMO.htm")
description<-Recode_variables0(htm_DEMO_1999_2000)
DEMO_1999_2000<-Recode_variables1(DEMO_1999_2000,description) 

DEMO_2001_2002 <- read.xport("./Member Data/2001_2002/Demographics/DEMO_B.XPT") 
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/2001-2002/DEMO_B.htm", "./Member Data/2001_2002/Demographics/DEMO_B.htm", method='auto', mode='wb') 
htm_DEMO_2001_2002<-read_html("./Member Data/2001_2002/Demographics/DEMO_B.htm") 
description<-Recode_variables0(htm_DEMO_2001_2002) 
DEMO_2001_2002<-Recode_variables1(DEMO_2001_2002,description) 
 
DEMO_2003_2004 <- read.xport("./Member Data/2003_2004/Demographics/DEMO_C.XPT") 
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/2003-2004/DEMO_C.htm", "./Member Data/2003_2004/Demographics/DEMO_C.htm", method='auto', mode='wb') 
htm_DEMO_2003_2004<-read_html("./Member Data/2003_2004/Demographics/DEMO_C.htm") 
description<-Recode_variables0(htm_DEMO_2003_2004) 
DEMO_2003_2004<-Recode_variables1(DEMO_2003_2004,description) 
 
# etc ... 
 
# Aggregate the demographic data for the first 3 flights 
# /!\ Be careful, here i simply aggregated all the flights. However sometimes the namings changed from a flight to another. So it is considered as 2 different variables when we aggregate the flights (not populated in the flights where it is the other naming) 
# Prior to aggregate, check and homogeneize the namings of the variables over the flights to get more relevant information 
DEMO<-rbind(setDT(DEMO_1999_2000), setDT(DEMO_2001_2002),setDT(DEMO_2003_2004), fill=TRUE) 
 
 
# Export 1 examination table (Body measures) for the first 3 flights 
# Export html description and use it to recode variables accordingly 
 
BMX_1999_2000 <- read.xport("./Member Data/1999_2000/Examination/BMX.XPT") 
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/BMX.htm", "./Member Data/1999_2000/Examination/BMX.htm", method='auto', mode='wb') 
htm_BMX_1999_2000<-read_html("./Member Data/1999_2000/Examination/BMX.htm") 
description<-Recode_variables0(htm_BMX_1999_2000) 
BMX_1999_2000<-Recode_variables1(BMX_1999_2000,description) 
 
BMX_2001_2002 <- read.xport("./Member Data/2001_2002/Examination/BMX_B.XPT") 
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/2001-2002/BMX_B.htm", "./Member Data/2001_2002/Examination/BMX_B.htm", method='auto', mode='wb') 
htm_BMX_2001_2002<-read_html("./Member Data/2001_2002/Examination/BMX_B.htm") 
description<-Recode_variables0(htm_BMX_2001_2002) 
BMX_2001_2002<-Recode_variables1(BMX_2001_2002,description) 
 
BMX_2003_2004 <- read.xport("./Member Data/2003_2004/Examination/BMX_C.XPT") 
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/2003-2004/BMX_C.htm", "./Member Data/2003_2004/Examination/BMX_C.htm", method='auto', mode='wb') 
htm_BMX_2003_2004<-read_html("./Member Data/2003_2004/Examination/BMX_C.htm") 
description<-Recode_variables0(htm_BMX_2003_2004) 
BMX_2003_2004<-Recode_variables1(BMX_2003_2004,description) 
 
# etc ... 
 
# Aggregate the Body measures data for the first 3 flights 
# /!\ Be careful, here i simply aggregated all the flights. However sometimes the namings changed from a flight to another. So it is considered as 2 different variables when we aggregate the flights (not populated in the flights where it is the other naming) 
# Prior to aggregate, check and homogeneize the namings of the variables over the flights to get more relevant information 
BMX<-rbind(setDT(BMX_1999_2000), setDT(BMX_2001_2002),setDT(BMX_2003_2004), fill=TRUE) 
 
 
# Export 1 laboratory table (Cholesterol - Total & HDL) for the first 3 flights 
# Export html description and use it to recode variables accordingly 
 
LAB13_1999_2000 <- read.xport("./Member Data/1999_2000/Laboratory/LAB13.XPT") 
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/LAB13.htm", "./Member Data/1999_2000/Laboratory/LAB13.htm", method='auto', mode='wb') 
htm_LAB13_1999_2000<-read_html("./Member Data/1999_2000/Laboratory/LAB13.htm") 
description<-Recode_variables0(htm_LAB13_1999_2000) 
LAB13_1999_2000<-Recode_variables1(LAB13_1999_2000,description) 
 
LAB13_2001_2002 <- read.xport("./Member Data/2001_2002/Laboratory/L13_B.XPT") 
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/2001-2002/L13_B.htm", "./Member Data/2001_2002/Laboratory/L13_B.htm", method='auto', mode='wb') 
htm_LAB13_2001_2002<-read_html("./Member Data/2001_2002/Laboratory/L13_B.htm") 
description<-Recode_variables0(htm_LAB13_2001_2002) 
LAB13_2001_2002<-Recode_variables1(LAB13_2001_2002,description) 
 
LAB13_2003_2004 <- read.xport("./Member Data/2003_2004/Laboratory/L13_C.XPT") 
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/2003-2004/L13_C.htm", "./Member Data/2003_2004/Laboratory/L13_C.htm", method='auto', mode='wb') 
htm_LAB13_2003_2004<-read_html("./Member Data/2003_2004/Laboratory/L13_C.htm") 
description<-Recode_variables0(htm_LAB13_2003_2004) 
LAB13_2003_2004<-Recode_variables1(LAB13_2003_2004,description) 
 
# etc ... 
 
# Aggregate the Cholesterol - Total & HDL - data for the first 3 flights 
# /!\ Be careful, here i simply aggregated all the flights. However sometimes the namings changed from a flight to another. So it is considered as 2 different variables when we aggregate the flights (not populated in the flights where it is the other naming) 
# Prior to aggregate, check and homogeneize the namings of the variables over the flights to get more relevant information 
LAB13<-rbind(setDT(LAB13_1999_2000), setDT(LAB13_2001_2002),setDT(LAB13_2003_2004), fill=TRUE) 
 
 
# Export 1 lquestionnaire table (Smoking) for the first 3 flights 
# Export html description and use it to recode variables accordingly 
 
SMQ_1999_2000 <- read.xport("./Member Data/1999_2000/Questionnaire/SMQ.XPT") 
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/1999-2000/SMQ.htm", "./Member Data/1999_2000/Questionnaire/SMQ.htm", method='auto', mode='wb') 
htm_SMQ_1999_2000<-read_html("./Member Data/1999_2000/Questionnaire/SMQ.htm") 
description<-Recode_variables0(htm_SMQ_1999_2000) 
SMQ_1999_2000<-Recode_variables1(SMQ_1999_2000,description) 
 
SMQ_2001_2002 <- read.xport("./Member Data/2001_2002/Questionnaire/SMQ_B.XPT") 
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/2001-2002/SMQ_B.htm", "./Member Data/2001_2002/Questionnaire/SMQ_B.htm", method='auto', mode='wb') 
htm_SMQ_2001_2002<-read_html("./Member Data/2001_2002/Questionnaire/SMQ_B.htm") 
description<-Recode_variables0(htm_SMQ_2001_2002) 
SMQ_2001_2002<-Recode_variables1(SMQ_2001_2002,description) 
 
SMQ_2003_2004 <- read.xport("./Member Data/2003_2004/Questionnaire/SMQ_C.XPT") 
#download.file("https://wwwn.cdc.gov/Nchs/Nhanes/2003-2004/SMQ_C.htm", "./Member Data/2003_2004/Questionnaire/SMQ_C.htm", method='auto', mode='wb') 
htm_SMQ_2003_2004<-read_html("./Member Data/2003_2004/Questionnaire/SMQ_C.htm") 
description<-Recode_variables0(htm_SMQ_2003_2004) 
SMQ_2003_2004<-Recode_variables1(SMQ_2003_2004,description) 
 
# etc ... 
 
# Aggregate the Smoking data for the first 3 flights 
# /!\ Be careful, here i simply aggregated all the flights. However sometimes the namings changed from a flight to another. So it is considered as 2 different variables when we aggregate the flights (not populated in the flights where it is the other naming) 
# Prior to aggregate, check and homogeneize the namings of the variables over the flights to get more relevant information 
SMQ<-rbind(setDT(SMQ_1999_2000), setDT(SMQ_2001_2002),setDT(SMQ_2003_2004), fill=TRUE) 
 
 
 
 
######################################################################################### 
# Merge the DEMO, Body Measures, Cholesterol and Smoking tables for the first 3 flights # 
######################################################################################### 
 
# Use the SEQN key 
 
Member_NHANES<-merge(DEMO,BMX,by="SEQN",all=TRUE) 
Member_NHANES<-merge(Member_NHANES,LAB13,by="SEQN",all=TRUE) 
Member_NHANES<-merge(Member_NHANES,SMQ,by="SEQN",all=TRUE) 

write.csv(Member_NHANES, file = "Member_NHANES.csv")
 
 