library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Info boxes"),
  dashboardSidebar(),
  dashboardBody(
    ##infobox
    # infoBoxes with fill=FALSE
    fluidRow(
      # A static infoBox
      infoBox("New Orders", 10 * 2, icon = icon("credit-card")),
      # Dynamic infoBoxes
      infoBoxOutput("progressBox"),
      infoBoxOutput("approvalBox")
    ),
    
    # infoBoxes with fill=TRUE
    fluidRow(
      infoBox("New Orders", 10 * 2, icon = icon("credit-card"), fill = TRUE),
      infoBoxOutput("progressBox2"),
      infoBoxOutput("approvalBox2")
    ),
    
    ## Value Box
    fluidRow(
      # A static valueBox
      valueBox(10 * 2, "vNew Orders", icon = icon("credit-card")),
      
      # Dynamic valueBoxes
      valueBoxOutput("vprogressBox"),
      
      valueBoxOutput("vapprovalBox")
    ),
    fluidRow(
      # Clicking this will increment the progress amount
      box(width = 4, actionButton("count", "Increment progress"))
    )
  )
)

## For the action on the box, mind the name
server <- function(input, output) {
  ## Action on infobox
  output$progressBox <- renderInfoBox({
    infoBox(
      "Progress", paste0(25 + input$count, "%"), icon = icon("list"),
      color = "purple"
    )
  })
  output$approvalBox <- renderInfoBox({
    infoBox(
      "Approval", "80%", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow"
    )
  })
  # Same as above, but with fill=TRUE
  output$progressBox2 <- renderInfoBox({
    infoBox(
      "Progress", paste0(25 + input$count, "%"), icon = icon("list"),
      color = "purple", fill = TRUE
    )
  })
  output$approvalBox2 <- renderInfoBox({
    infoBox(
      "Approval", "80%", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow", fill = TRUE
    )
  })
  ## Action on valuebox
  output$vprogressBox <- renderValueBox({
    valueBox(
      paste0(25 + input$count, "%"), "Progress", icon = icon("list"),
      color = "purple"
    )
  })
  output$vapprovalBox <- renderValueBox({
    valueBox(
      "80%", "Approval", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow"
    )
  })
}

shinyApp(ui, server)
