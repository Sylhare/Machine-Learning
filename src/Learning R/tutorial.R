#' ---
#' title: "tutorial"
#' source: DataCamp
#' ---


###################################
### Numeric, Boolean and String ###
###################################

# An addition
5 + 5 

# A subtraction
5 - 5 

# A multiplication
3 * 5

 # A division
(5 + 5) / 2 

# Exponentiation
2^5

# Modulo
28 %% 6

# Assign the value 42 to x
x <- 42

# Print out the value of the variable x
x

# Declare variables of different types
my_numeric <- 42
my_character <- "universe"
my_logical <- FALSE 

# Check class of my_numeric
class(my_numeric)

# Check class of my_character
class(my_character)

# Check class of my_logical
class(my_logical)

# Comparison of logicals
TRUE == FALSE

# Comparison of numerics
-6 * 14 != 17 -101

# Comparison of character strings
"useR" == "user"

# Compare a logical with a numeric
TRUE == 1

# Comparison of numerics
-6 * 5 + 2 >= -10 + 1

# Comparison of character strings
"raining" <= "raining dogs"

# Comparison of logicals
TRUE > FALSE


#########################
### Vector and Matrix ###
#########################

# create a vector with the combine function c()
numeric_vector <- c(1, 10, 49)
character_vector <- c("a", "b", "c")
boolean_vector <- c(TRUE, FALSE, TRUE)

# give a name to the elements of a vector with the names()
some_vector <- c("John Doe", "poker player")
names(some_vector) <- c("Name", "Profession")

# Notice that the first element in a vector has index 1, not 0 as in many other programming languages
some_vector[1]

# Sum of two vectors in R (these are equivalents)
c(1, 2, 3) + c(4, 5, 6)
c(1 + 4, 2 + 5, 3 + 6)
c(5, 7, 9)

A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the sum of A_vector and B_vector
total_vector <- A_vector + B_vector
  
# Print out total_vector
total_vector

# Construct a matrix with 3 rows that contain the numbers 1 up to 9, filled by row
matrix(1:9, byrow = TRUE, nrow = 3)

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
last <- tail(linkedin, 1)
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)

# Popular days
linkedin > 15

# Quiet days
linkedin <= 5

# LinkedIn more popular than Facebook
linkedin > facebook

# When does views equal 13?
views == 13

# When is views less than or equal to 14?
views <= 14

# Is last under 5 or above 10?
5 > last | last > 10

# Is last between 15 (exclusive) and 20 (inclusive)?
15 < last & last <= 20

# linkedin exceeds 10 but facebook below 10
linkedin > 10 & facebook < 10

# When were one or both visited at least 12 times?
linkedin >= 12 | facebook >= 12

# When is views between 11 (exclusive) and 14 (inclusive)?
11 < views & views <= 14




