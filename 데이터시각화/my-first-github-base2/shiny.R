# Shiny 시각화
install.packages("shiny")
library(shiny)

ui <- fluidPage(
    tags$h1("Hello, Shiny!"),
)

server <- function (input, output, session) {
    # 넣어보기
}



ui <- fluidPage(
    selectInput("dataset",label = "데이터셋",choices = c("iris","mtcars")),verbatimTextOutput("summary"),
    tableOutput("table"))

server <-  function(input,ouput){
    output$summary <- renderPrint({
        dataset <- get(input$myselection,"package:dataset")
        str(dataset)
    })

    output$table <- renderTable({
        mydf <- get(input$dataset,"package:dataset")
        dataset
        
    })
}
shinyApp(ui = ui, server=server)

