#' title: Titanic test 
#' Description: In this challenge, we ask you to complete the analysis of what sorts of people were likely to survive. 
#' In particular, we ask you to apply the tools of machine learning to predict which passengers survived the tragedy.
#' Link: https://www.kaggle.com/c/titanic/data
#' ---

# Installing the required librairies
 install.packages("caret", dependencies = TRUE)
 install.packages("randomForest")

# Loading the librairies
library(caret)
library(randomForest)
library(fields)
 
 # Making sure you working at the right place
 getwd()
 
# If not correct, set the working directory where the file is
# setwd("C:/Path/to/the/file")

# Loading the sets
testSet <- read.table("../../data/Titanic/test.csv", sep = ",", header = TRUE)
trainSet <- read.table("../../data/Titanic/train.csv", sep = ",", header = TRUE)

# Looking at the fist values of each sets
head(testSet)
head(trainSet)

# See the name of columns
names(train)
names(test)

# Mean
mean(train$Fare)
# Median
median(train$Fare)
# Quantile
quantile(train$Fare)
# Variance
var(train$Fare)
# Standard Deviation
sd(train$Fare)

# Statistical summary of the train dataset
summary(train)

# Change the display 
# mfrow=c(nrows, ncols) to create a matrix of nrows x ncols plots
par(mfrow=c(1,1))

# Plot
plot(x = train$PassengerId , y = train$Fare, type = 'p')
# Histogram
hist(train$Age)
# Bar Plot
counts <- table(train$SibSp)
barplot(counts, main="Siblings Distribution",  xlab="Number of Siblings")

# Create a cross table between the survival and the class of the passenger
table(trainSet[,c("Survived", "Pclass")])

# Plot comparing Survival rate (x axe) and Age (y axe)
bplot.xy(trainSet$Survived, trainSet$Age)

# Gives some details about the Age data of the set (lot's of NA = no value)
summary(trainSet$Age)

# Comparing Survival Rate and Fare
bplot.xy(trainSet$Survived, trainSet$Fare)
summary(trainSet$Fare)

# Convert Survived to Factor data type for classification model
trainSet$Survived <- factor(trainSet$Survived)

# Train the model using a "random forest" algorithm
model <- train(Survived ~ Pclass + Sex + SibSp +   
                    Embarked + Parch + Fare, # Survived is a function of the variables we decided to include
                  data = trainSet, # Use the trainSet dataframe as the training data
                  method = "rf",# Use the "random forest" algorithm
                  trControl = trainControl(method = "cv", # Use cross-validation
                                           number = 5) # Use 5 folds for cross-validation (instead of having a training and a real data set)
               )

# To see the created model
model

# Making the prediction 
testSet$Survived <- predict(model, newdata = testSet)
# Error in `$<-.data.frame`(`*tmp*`, Survived, value = c(1L, 1L, 1L, 1L,  : replacement has 417 rows, data has 418
# This error means there's a "NA" in the data set, we need to change that
# Summary will give this information -> fare has 1 NA
summary(testSet)

# Now we need to remove the NA
# if an entry in the column "Fare" is NA, then replace it with the mean of the column
testSet$Fare <- ifelse(is.na(testSet$Fare), mean(testSet$Fare, na.rm = TRUE), testSet$Fare)

# Now we can do the prediction, adding the survived column to the test set
testSet$Survived <- predict(model, newdata = testSet)

# TO see the results of the prediction
summary(testSet$Survived)

# Create the submission file for Kaggle with only the required columns
submission <- testSet[,c("PassengerId", "Survived")]
write.table(submission, file = "titanic_submission.csv", col.names = TRUE, row.names = FALSE, sep = ",")

# Score of 0.77033 on kaggle