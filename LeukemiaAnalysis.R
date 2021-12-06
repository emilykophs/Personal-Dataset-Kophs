require(data.table)
library(ggplot2)
library(GGally)

data<-as.data.frame(fread("~/Downloads/aml_ohsu_2018_clinical_data.tsv"))

leukemia_data<-data[c(4,6,8,10,14,21,41)]
leukemia_data<-leukemia_data[leukemia_data$`Cancer Type` %in% "Leukemia",]
leukemia_data<-na.omit(leukemia_data)
leukemia_data$`Cause of death source`[leukemia_data$`Cause of death source`=="Dead-Other"]<-"Alive"
leukemia_data<-leukemia_data[!(leukemia_data$`Cause of death source` %in% "Dead-Unknown"),]
leukemia_data<-leukemia_data[!(leukemia_data$`Cause of death source` %in% "Dead-Treatment"),]
leukemia_data$`Cause of death source`<-as.factor(leukemia_data$`Cause of death source`)
leukemia_data$Chemotherapy<-as.factor(leukemia_data$Chemotherapy)

write.csv(leukemia_data,"leukemia.csv")


ggplot(leukemia_data,aes(x=`Cause of death source`, y=`Bone Marrow Blast Percentage`))+geom_boxplot(aes(fill = `Cause of death source`)) + ggtitle("Distribution of Bone Marrow Blast Percentage for Patients Who Lived vs. Died") +xlab("Cause of Death")+ylab("Bone Marrow Blast Percentage")

ggplot(leukemia_data,aes(x=`Cause of death source`, y=`Hemoglobin level`))+geom_boxplot(aes(fill =`Cause of death source`)) + ggtitle("Distribution of Hemoglobin Levels for Patients Who Lived vs. Died") +xlab("Cause of Death")+ylab("Hemoglobin Level")

logREG<-glm(formula=as.factor(`Cause of death source`)~`Bone Marrow Blast Percentage` + `Hemoglobin level`, family = binomial, data = leukemia_data)
summary(logREG)

leukemia_data$fitted_values<-logREG$fitted.values
leukemia_data$prediction<-ifelse(leukemia_data$fitted_values <.5,"Dead-Disease","Alive")
mean(leukemia_data$prediction == leukemia_data$`Cause of death source`)

ggplot(leukemia_data, aes(x = `Cause of death source`, y = fitted_values)) + geom_boxplot(aes(fill = `Cause of death source`)) + ggtitle("Comparison of the Model to the Actual Cause of Death") + xlab("Actual Cause of Death") + ylab("Fitted Values") + theme(legend.position = "none")
