#' ---
#' title: "Shiny dashboard intro"
#' source: ShinyDashboard
#' ---

# install.packages("shinydashboard", dependencies = TRUE)
# install.packages("shiny", dependencies = TRUE)
library(shiny)
library(shinydashboard)

# Create an empty header
header <- dashboardHeader()

# Create an empty sidebar
sidebar <- dashboardSidebar()

# Create an empty body
body <- dashboardBody()

# Create the UI using the header, sidebar, and body
ui <- dashboardPage(header, sidebar, body)






# To start the dashboard
server <- function(input, output) {}
shinyApp(ui, server)
