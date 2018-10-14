library(shiny)
library(shinydashboard)


## dropdown menu message
message <- dropdownMenu(type = "messages",
             messageItem(
               from = "Sales Dept",
               message = "Sales are steady this month."
             ),
             messageItem(
               from = "New User",
               message = "How do I register?",
               icon = icon("question"),
               time = "13:45"
             ),
             messageItem(
               from = "Support",
               message = "The new server is ready.",
               icon = icon("life-ring"),
               time = "2014-12-01"
             )
)

## drop down notifs
notification <- dropdownMenu(type = "notifications",
             notificationItem(
               text = "5 new users today",
               icon("users")
             ),
             notificationItem(
               text = "12 items delivered",
               icon("truck"),
               status = "success"
             ),
             notificationItem(
               text = "Server load at 86%",
               icon = icon("exclamation-triangle"),
               status = "warning"
             )
)

## drop down Tasks
tasks <- dropdownMenu(type = "tasks", badgeStatus = "success",
             taskItem(value = 90, color = "green",
                      "Documentation"
             ),
             taskItem(value = 17, color = "aqua",
                      "Project X"
             ),
             taskItem(value = 75, color = "yellow",
                      "Server deployment"
             ),
             taskItem(value = 80, color = "red",
                      "Overall project"
             )
)
## Header
header <- dashboardHeader(title = "Basic dashboard", message, notification, tasks)

## Sidebar content
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Widgets", tabName = "widgets", icon = icon("th"))
  )
)

## Tab box item
taboxs <- fluidRow(
  tabBox(
    title = "First tabBox",
    # The id lets us use input$tabset1 on the server to find the current tab
    id = "tabset1", height = "250px",
    tabPanel("Tab1", "First tab content"),
    tabPanel("Tab2", "Tab content 2")
  ),
  tabBox(
    side = "right", height = "250px",
    selected = "Tab3",
    tabPanel("Tab1", "Tab content 1"),
    tabPanel("Tab2", "Tab content 2"),
    tabPanel("Tab3", "Note that when side=right, the tab order is reversed.")
  )
)

## InfoBox
info1 <- fluidRow(
  # A static infoBox
  infoBox("New Orders", 10 * 2, icon = icon("credit-card")),
  # Dynamic infoBoxes
  infoBoxOutput("progressBox"),
  infoBoxOutput("approvalBox")
)

### infoBoxes with fill=TRUE
info2 <- fluidRow(
  infoBox("New Orders", 10 * 2, icon = icon("credit-card"), fill = TRUE),
  infoBoxOutput("progressBox2"),
  infoBoxOutput("approvalBox2")
)

## Body content
body <- dashboardBody(
  tabItems(
    # Dashboard tab content
    tabItem(tabName = "dashboard",
            fluidRow(
              box(
                title = "Histogram", status = "primary", solidHeader = TRUE,
                collapsible = TRUE,
                plotOutput("plot1", height = 250)
              ),
              
              box(
                title = "Inputs", status = "warning", solidHeader = TRUE,
                "Box content here", br(), "More box content",
                sliderInput("slider", "Slider input:", 1, 100, 50),
                textInput("text", "Text input:")
              )
            )
    ),
    
    # Widget tab content
    tabItem(tabName = "widgets",
            h2("Widgets tab content"),
            taboxs,
            info1,
            info2
    )
  )
)

ui <- dashboardPage(
  header,
  sidebar,
  body
)
  

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)
