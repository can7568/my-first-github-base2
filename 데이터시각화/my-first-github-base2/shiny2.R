# Shiny 시각화
#install.packages("shiny")
library(shiny)


ui <- fluidPage(
    selectInput("myselection",
                label = "데이터셋",
                choices = c("iris","mtcars")),
    verbatimTextOutput("summary"),
    tableOutput("table"))

server <-  function(input,output){
    output$summary <- renderPrint({
        dataset <- get(input$myselection,"package:datasets")
        str(dataset)
    })
    
    output$table <- renderTable({
        mydf <- get(input$dataset,"package:datasets")
        mydf
        
    })
} 

shinyApp(ui = ui, server=server)

