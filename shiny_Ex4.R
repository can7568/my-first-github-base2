library(shiny)

ui <- pageWithSidebar(
    headerPanel("나의 첫 반응형 웹앱"),
    
    sidebarPanel (sliderInput(inputId = "count",
                              "개수를 선택하세요",
                              min = 1,
                              max = 1000,
                              value = 500)
    ),
    mainPanel(
        plotOutput("distPlot")
        )
)

server <- function(input,output){
    output$distPlot <- renderPlot({
        dist <- rnorm(input$count)
        hist(dist,col = "pink3",breaks = 50)
    })
}

shinyApp(ui,server)
