library(shiny)

ui <- fluidPage(
    selectInput("myselection",
                label = "데이터셋",
                choices = c("iris","mtcars")),
    verbatimTextOutput("summary"),
    tableOutput("table"))
    

