#' ---
#' title: "mtcars_dataframe"
#' description : "Exploration of the titanic data"
#' ---


# ---------------------
#    Librairies 
# ---------------------

# Installing the required librairies
install.packages('ggplot2')
install.packages('dplyr') 
install.packages('ggthemes') 
install.packages('randomForest') 

# librairies
library('ggplot2') # visualization
library('dplyr') # data manipulation
library('ggthemes') # visualization
library('randomForest') # classification algorithm


# ---------------------
#    Titanic Data 
# ---------------------

# Variable Name | Description
# --------------|-------------
# Survived      | Survived (1) or died (0)
# Pclass        | Passenger's class
# Name          | Passenger's name
# Sex           | Passenger's sex
# Age           | Passenger's age
# SibSp         | Number of siblings/spouses aboard
# Parch         | Number of parents/children aboard
# Ticket        | Ticket number
# Fare          | Fare
# Cabin         | Cabin
# Embarked      | Port of embarkation

# Load data
train <- read.csv("../../data/Titanic/train.csv", stringsAsFactors=FALSE)
test  <- read.csv("../../data/Titanic/test.csv",  stringsAsFactors=FALSE)

# bind training & test data to create a better model that will better perform
full  <- bind_rows(train, test) 

# Equivalent of the train dataset
full[1:891,]

# Give information on data, data type
str(full)

# Give some statistical information on the data
summary(full)

# Show any numerical missing values (1=observed, 0=missing)
md.pattern(full) #Warning NAs introduced by Coercicion


# ---------------------
#      Title (new)
# ---------------------

# Grab title from passenger names
full$Title <- gsub('(.*, )|(\\..*)', '', full$Name)

# Show title counts by sex
table(full$Sex, full$Title)

# Reassign rare titles
officer <- c('Capt', 'Col', 'Don', 'Dr', 'Major', 'Rev')
royalty <- c('Dona', 'Lady', 'the Countess','Sir', 'Jonkheer')

# Reassign mlle, ms, and mme, and rare
full$Title[full$Title == 'Mlle']        <- 'Miss' 
full$Title[full$Title == 'Ms']          <- 'Miss'
full$Title[full$Title == 'Mme']         <- 'Mrs' 
full$Title[full$Title %in% royalty]  <- 'Royalty'
full$Title[full$Title %in% officer]  <- 'Officer'

# Show only the fields where the title is "Master"
filter(full, Title <= "Master")


# ---------------------
#     Family (new)
# ---------------------

# Create a family size variable including the passenger themselves
full$Fsize <- full$SibSp + full$Parch + 1

# FsizeD Category of Family
full$FsizeD[full$Fsize == 1] <- 'Singleton'
full$FsizeD[full$Fsize < 5 & full$Fsize > 1] <- 'Small'
full$FsizeD[full$Fsize > 4] <- 'Large'


# ---------------------
#        Age
# ---------------------

# Show information median age per Pclass
tapply(full$Age, full$Pclass,median, na.rm=TRUE)

# Show information median age per title
tapply(full$Age, full$Title,median, na.rm=TRUE)

# Sum of age with NA
sum(is.na(full$Age))

# Create a vector with the median age per titles and replace the na in age.
title.age <- aggregate(full$Age,by = list(full$Title), FUN = function(x) median(x, na.rm = T))
full[is.na(full$Age), "Age"] <- apply(full[is.na(full$Age), ] , 1, function(x) title.age[title.age[, 1]==x["Title"], 2]) 


# ---------------------
#     Child (new)
# ---------------------

# Creates a Child column that will say if the passenger is a child or not
full$Child[full$Age < 18] <- TRUE
full$Child[full$Age >= 18] <- FALSE


# ---------------------
#        Embarked
# ---------------------

# Most common value for Embarked by Pclass (S)
tapply(full$Embarked, full$Pclass,median, na.rm=TRUE)

# Replace empty values by S
full$Embarked[full$Embarked==""] = "S"



# ---------------------
#        Fare
# ---------------------

tapply(full$Fare, full$Pclass,median, na.rm=TRUE)

# Replace NA value by the mean Fare based on their PClass
full[is.na(full$Fare), "Fare"] <-  median(full[full$Pclass, ]$Fare, na.rm = TRUE)


# ---------------------
#    Creating model
# ---------------------

# Set a random seed, to get same results
set.seed(144)

# Build the model (note: not all possible variables are used)
rf_model <- randomForest(factor(Survived) ~ Pclass + Sex + Age + Fare + Embarked + Title + FsizeD + Child,
                         data = full)

# Get importance of each variable for the random forest algorithm by calculating the mean decrease in Gini coefficient.
# Each time a particular variable is used to split a node, 
# the Gini coefficient for the child nodes are calculated and compared to that of the original node. 
# The Gini coefficient is a measure of homogeneity from 0 (homogeneous) to 1 (heterogeneous).
importance    <- importance(rf_model)
varImportance <- data.frame(Variables = row.names(importance), 
                            Importance = round(importance[ ,'MeanDecreaseGini'],2))

# Create a rank variable based on importance
rankImportance <- varImportance %>%
  mutate(Rank = paste0('#',dense_rank(desc(Importance))))


# ---------------------
#     Prediction
# ---------------------

# Predict using the test set
prediction <- predict(rf_model, test)

# Save the solution to a dataframe with two columns: PassengerId and Survived (prediction)
solution <- data.frame(PassengerID = test$PassengerId, Survived = prediction)

# Write the solution to file
write.csv(solution, file = 'rf_solution.csv', row.names = F)


# ---------------------
#       Graphics
# ---------------------

# Surival rate based on title
ggplot(full[1:891,], aes(Title,fill = factor(Survived))) +
  geom_bar(stat = "count")+
  xlab('Title') +
  ylab("Count") +
  scale_fill_discrete(name = " Survived") + 
  ggtitle("Title vs Survived")+
  theme_few()

# Family size over survival rate
ggplot(full[1:891,], aes(x = Fsize, fill = factor(Survived))) +
  geom_bar(stat='count', position='dodge') +
  scale_x_continuous(breaks=c(1:11)) +
  xlab('Family Size') +
  ylab("Count") +
  theme_few()+
  scale_fill_discrete(name = "Survived") + 
  ggtitle("Family Size vs Survived")

# Mosaic plot of family size and Survival rate
mosaicplot(table(full$FsizeD, full$Survived), main='Family Size by Survival', ylab="Survived",xlab="FsizeD",col = hcl(c(50, 120)))

# Histogram of age repartition
par(mfrow=c(1,1))
hist(full$Age, breaks = 10, freq=F, border = 'white', main='Age proportion', 
     col='lightblue', ylim=c(0,0.07))

# Surival rate per child and Sex
ggplot(full[1:891,], aes(Child, fill = factor(Survived))) + 
  geom_bar(stat = "count")+
  theme_few() +
  xlab("is Child") +
  ylab("Count") +
  facet_wrap(~Sex) + 
  scale_fill_discrete(name = "Survived") + 
  ggtitle("Age Category vs Sex vs Survived")

# Survival rate over Pclass and port of embarkment
ggplot(full[1:891,], aes(Pclass, fill = factor(Survived))) + 
  geom_bar(stat = "count")+
  theme_few() +
  xlab("Pclass") +
  ylab("Count") +
  facet_wrap(~Embarked) + 
  scale_fill_discrete(name = "Survived") + 
  ggtitle("Embarked vs Pclass vs Survived")

# Fare density per class; we've limited the x axis so the diagram stays visible.
ggplot(full, 
       aes(x = Fare)) +
  geom_density(data = full[full$Pclass == '1', ],fill = 'green', alpha=0.4) + 
  geom_density(data = full[full$Pclass == '2', ],fill = 'blue', alpha=0.4) + 
  geom_density(data = full[full$Pclass == '3', ],fill = 'red', alpha=0.4) + 
  xlab('Fare') +
  xlim(0, 200) + # (Warning message: Removed 38 rows containing non-finitevalues (stat_density). )
  ggtitle("Pclass")+
  ylab("Density") +
  theme_few()

# Show model error
plot(rf_model, ylim=c(0,0.36))
legend('topright', colnames(rf_model$err.rate), col=1:3, fill=1:3)

# Visualize the relative importance of variables by plotting the mean decrease in Gini calculated across all trees
ggplot(rankImportance, aes(x = reorder(Variables, Importance), 
                           y = Importance, fill = Importance)) +
  geom_bar(stat='identity') + 
  geom_text(aes(x = Variables, y = 0.5, label = Rank),
            hjust=0, vjust=0.55, size = 4, colour = 'red') +
  labs(x = 'Variables') +
  coord_flip() + 
  theme_few()




