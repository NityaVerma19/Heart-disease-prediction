#install.packages("rpart")
#install.packages("rpart.plot")
#install.packages("caTools")
#install.packages('party')
#install.packages('dplyr')
#install.packages('magrittr')
library(rpart)
library(rpart.plot)
library(caTools)
library(party)
library(dplyr)
library(magrittr)

choose.files()
df <- read.csv("C:\\Users\\adite\\Downloads\\framingham.csv")
dim(df)
summary(df)

set.seed(123)

split = sample.split(df$TenYearCHD, SplitRatio = 0.75)

training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

tree <- rpart(TenYearCHD ~ ., data = training_set)
rpart.plot(tree)

prediction <- predict(tree, newdata = test_set)

cm <- table(test_set$TenYearCHD, prediction)
cm

accuracy <- sum(diag(cm)) / sum(cm)
print(paste('Accuracy on test data is ', accuracy))

