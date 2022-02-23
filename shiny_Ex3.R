library(shiny)

ui <- pageWithSidebar(
    headerPanel("Header"),
    sidebarPanel ("Sidebar"),
    mainPanel("Main")
)

server <- function(input,output){
    
}

shinyApp(ui,server)
