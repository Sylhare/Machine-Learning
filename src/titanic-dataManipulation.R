# Load data
train <- read.csv("../data/Titanic/train.csv", stringsAsFactors=FALSE)
test  <- read.csv("../data/Titanic/test.csv",  stringsAsFactors=FALSE)

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
