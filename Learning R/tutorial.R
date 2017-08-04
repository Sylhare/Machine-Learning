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

# Construct a matrix with 3 rows that contain the numbers 1 up to 9, filled by row
matrix(1:9, byrow = TRUE, nrow = 3)
