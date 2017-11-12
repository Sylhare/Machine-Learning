#' ---
#' title: "Dataframe"
#' source: DataCamp
#' ---

## Getting some information of a pre existing Dataframe
# Print out built-in R data frame 
mtcars 

# Call head() on mtcars to show the first few rows
head(mtcars)

# Investigate the structure of mtcars
str(mtcars)

# Overview of the dataframe
summary(mtcars)

## Creating a Dataframe
# Definition of vectors
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name, type, diameter, rotation, rings)

# Print out diameter of Mercury (row 1, column 3)
planets_df[1,3]

# Print out data for Mars (entire fourth row)
planets_df[4,]

# Select first 5 values of diameter column
planets_df[1:5,"diameter"]

# Select the rings variable from planets_df
rings_vector <- planets_df[,"rings"]

# Print out rings_vector
rings_vector

# Select all columns for planets with rings
planets_df[rings_vector,]
subset(planets_df, subset = rings) # for a more direct approach

# Create a subset and select planets with diameter < 1
subset(planets_df, subset = diameter < 1)

# Use order() to create positions
positions <-  order(planets_df$diameter)

# Use positions to sort planets_df
planets_df[positions,]