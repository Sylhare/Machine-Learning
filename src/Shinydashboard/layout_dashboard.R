## Column Layout
tabcol <- tabItem(tabName = "Column",
  fluidRow(
    column(width = 4,
           box(
             title = "Box title", width = NULL, status = "primary",
             "Box content"
           ),
           box(
             title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
             "Box content"
           ),
           box(
             width = NULL, background = "black",
             "A box with a solid black background"
           )
    ),
    
    column(width = 4,
           box(
             status = "warning", width = NULL,
             "Box content"
           ),
           box(
             title = "Title 3", width = NULL, solidHeader = TRUE, status = "warning",
             "Box content"
           ),
           box(
             title = "Title 5", width = NULL, background = "light-blue",
             "A box with a solid light-blue background"
           )
    ),
    
    column(width = 4,
           box(
             title = "Title 2", width = NULL, solidHeader = TRUE,
             "Box content"
           ),
           box(
             title = "Title 6", width = NULL, background = "maroon",
             "A box with a solid maroon background"
           )
    )
  )
)

## Row layout
tabrow <- tabItem(tabName = "Row",
                  fluidRow(
                    box(title = "Box title", "Box content"),
                    box(status = "warning", "Box content")
                  ),
                  
                  fluidRow(
                    box(
                      title = "Title 1", width = 4, solidHeader = TRUE, status = "primary",
                      "Box content"
                    ),
                    box(
                      title = "Title 2", width = 4, solidHeader = TRUE,
                      "Box content"
                    ),
                    box(
                      title = "Title 1", width = 4, solidHeader = TRUE, status = "warning",
                      "Box content"
                    )
                  ),
                  
                  fluidRow(
                    box(
                      width = 4, background = "black",
                      "A box with a solid black background"
                    ),
                    box(
                      title = "Title 5", width = 4, background = "light-blue",
                      "A box with a solid light-blue background"
                    ),
                    box(
                      title = "Title 6",width = 4, background = "maroon",
                      "A box with a solid maroon background"
                    )
                  )
)

## Mixed
tabmix <- tabItem(tabName = "Mixed",
  fluidRow(
    box(
      title = "Box title", width = 6, status = "primary",
      "Box content"
    ),
    box(
      status = "warning", width = 6,
      "Box content"
    )
  ),
  
  fluidRow(
    column(width = 4,
           box(
             title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
             "Box content"
           ),
           box(
             width = NULL, background = "black",
             "A box with a solid black background"
           )
    ),
    
    column(width = 4,
           box(
             title = "Title 3", width = NULL, solidHeader = TRUE, status = "warning",
             "Box content"
           ),
           box(
             title = "Title 5", width = NULL, background = "light-blue",
             "A box with a solid light-blue background"
           )
    ),
    
    column(width = 4,
           box(
             title = "Title 2", width = NULL, solidHeader = TRUE,
             "Box content"
           ),
           box(
             title = "Title 6", width = NULL, background = "maroon",
             "A box with a solid maroon background"
           )
    )
  )
)


## Sidebar content
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Row", tabName = "Row", icon = icon("th")),
    menuItem("Column", tabName = "Column", icon = icon("th")),
    menuItem("Mixed", tabName = "Mixed", icon = icon("th"))
  )
)

## Body
body <- dashboardBody(
  tabItems(
    # Dashboard tab content
    tabrow,
    tabcol,
    tabmix
  )
)


# We'll save it in a variable `ui` so that we can preview it in the console
ui <- dashboardPage(
  dashboardHeader(title = "Layout"),
  sidebar,
  body
)

# Preview the UI in the console
shinyApp(ui = ui, server = function(input, output) { })