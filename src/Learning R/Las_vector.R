# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)

# The variable days_vector
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Assign the names of the day to roulette_vector and poker_vector
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Define a new variable based on a selection
poker_wednesday <- poker_vector[3]

# Define a new variable based on a selection
poker_midweek <- poker_vector[c(2, 3, 4)]
roulette_selection_vector <- roulette_vector[c(2:5)]

# Select poker results for Monday, Tuesday and Wednesday
poker_start <- poker_vector[c("Monday", "Tuesday", "Wednesday")]
  
# Calculate the average of the elements in poker_start
mean(poker_start)

# Assign to total_daily how much you won/lost on each day
total_daily <- poker_vector + roulette_vector

# Total winnings with poker
total_poker <- sum(poker_vector)

# Total winnings with roulette
total_roulette <- sum(roulette_vector) 

# Total winnings overall
total_week <- total_roulette + total_poker
total_week

# Calculate total gains for poker and roulette
total_poker <- sum(poker_vector)
total_roulette <- sum (roulette_vector)

# Check if you realized higher total gains in poker than in roulette 
total_poker > total_roulette

# Which days did you make money on poker?
selection_vector <- poker_vector > 0

# Select from poker_vector these days
poker_winning_days <- poker_vector[selection_vector]

# Which days did you make money on roulette?
selection_vector <- roulette_vector > 0

# Select from roulette_vector these days
roulette_winning_days <- roulette_vector[selection_vector]