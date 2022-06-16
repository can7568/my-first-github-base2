library(shiny)

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