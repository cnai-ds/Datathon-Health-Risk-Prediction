source("./1_Mortality_Data.R") 
source("./2_2_Member_Data.R") 
colnames(Mortality_NHANES)[colnames(Mortality_NHANES)=="seqn"]<-"SEQN" 
Mortality_NHANES$SEQN<-as.numeric(Mortality_NHANES$SEQN) 
NHANES_ALL<-merge(Member_NHANES,Mortality_NHANES,by="SEQN",all=TRUE) 
 
write.csv(NHANES_ALL, file = "NHANES_ALL.csv")
#save(NHANES_ALL,file="./NHANES_database_example.RData")
