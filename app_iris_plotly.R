library(shiny)
library(dplyr)
library(plotly)

ui <- fluidPage(
    titlePanel("Hello Shiny!"),
    sidebarLayout(
        sidebarPanel(
            actionButton("do", "Click Me")
        ),
        mainPanel(
            plotly::plotlyOutput("grafico")
        )
    )
)
server <- function(input, output, session) {
    output$grafico <- plotly::renderPlotly({
        plot_ly(
            data(), x = ~Sepal.Length, y = ~Sepal.Width, color = ~Species,
            type = "scatter", mode = "markers")
    })
    data <- eventReactive(input$do, {
        sample_n(iris, 30)
    })
}
shinyApp(ui, server)
