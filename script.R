rm(list=ls())
library(Hmisc)

data <- read.csv("C:/Users/mages/Desktop/Covid_data/COVID19_line_list_data.csv") 
describe (data)

# if death variable isn't 0, then the patient has died

data$death_dummy <- as.integer(data$death != 0)

# death rate of our dataset

sum(data$death_dummy) / nrow(data)

#Age
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)

mean(dead$age, na.rm=TRUE)
mean(alive$age, na.rm=TRUE)

t.test(dead$age, alive$age, alternative="two.sided", conf.level = 0.95)

# GENDER
men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm=TRUE)
mean(women$death_dummy, na.rm=TRUE)
t.test(men$death_dummy, women$death_dummy, alternative="two.sided", conf.level = 0.95)

#confidence interval of 95% shows that mean will have from 1.7% to 7.8% higher death rate than women.

#p-value = 0.002 < 0.05, so this is statistically significant
