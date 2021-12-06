# Personal-Dataset-Kophs
# MOTIVATION
As a Biochemistry major on the Pre-med track I was interested in health-related datasets. I found a database for cancer research that included a variety of data for different types of cancer. I chose a Leukemia dataset in the interest of being able to determine which variables are most useful when predicting whether a patient will survive the disease.

# DATA PROCESS

I analyzed data from cBioPortal for Cancer Genomics. The original dataset included samples from 672 cancer patients. I uploaded this data set in R where I then created a new data table with only my variables of interest. I chose to look more specifically at the age, bone marrow blasts, cancer type, cause of death, chemotherapy, cumulative treatment counts, and hemoglobin levels of those sampled. Since I was only interested in Leukemia patients, I omitted samples with other cancer types. I also removed any rows with "NA" values. I wanted to compare the data of those who died from Leukemia to those who survived the disease, so I replaced the cause of death value, "Death-other", with "Alive" since these patients did not die of Leukemia. I also removed patients recorded as, "Dead-Unknown" or "Dead-Treatment" since these deaths may or may not have been the direct result of Leukemia. Finally, I changed columns with categorical variables from string to factor values. This brought the sample size down to 235 patients. 

Original Data Source: https://www.cbioportal.org/study/summary?id=aml_ohsu_2018

# VISUALIZATION

## Figure 1 

<img width="699" alt="Screen Shot 2021-12-05 at 11 37 39 PM" src="https://user-images.githubusercontent.com/91345977/144806216-dc532a9d-c230-406c-9f9c-04ed60a0f9b7.png">

Figure 1 shows a comparison of the distribution of the percentage of bone marrow blasts in patients who lived to that of those who died. Although the distributions are quite similar, the plot for patients who died has a larger interquartile range and a smaller median value. There is greater variability in percentage of bone marrow blasts for patients who have died than those that survived. 

## Figure 2

<img width="700" alt="Screen Shot 2021-12-05 at 11 42 17 PM" src="https://user-images.githubusercontent.com/91345977/144806768-3c78b1b2-f4c2-47c4-8db1-1aeaeb42184f.png">

Figure 2 shows a comparison of the distribution of the hemoglobin levels in patients who lived to that of those who died. In this visualization, the distribution of hemoglobin levels in patients who died has a smaller interquartile range than that for those who lived. The distribution for those who died has a few outliers, which may be skewing the data. The median hemoglobin level for patients that died is higher than the median hemoglobin level for patients who lived. 

## Figure 3 

<img width="698" alt="Screen Shot 2021-12-05 at 11 43 18 PM" src="https://user-images.githubusercontent.com/91345977/144806847-812c3a33-c32f-4963-bbb9-efbacf59e805.png">

Figure 3 is a visualization of how well the model was able to predict a patient's survival based on their percentage of bone marrow blasts and hemoglobin levels. A fitted value less than 0.5 predicts the patient died of Leukemia and a value greater than 0.5 predicts the patient survived. 

# ANALYSIS

To analyze the data, I performed a multiple logistic regression. This regression method was used to predict the categorical survival variable from the numerical, percentage of bone marrow blasts and hemoglobin levels, variables. The regression model was only able to accurately predict the survival of 48% of the patients represented in the provided data. 
