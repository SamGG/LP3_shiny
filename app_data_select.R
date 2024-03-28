library(shiny)
ui <- fluidPage(
    selectInput(inputId = "user_data", label = "Dataset", choices = ls("package:datasets")),
    verbatimTextOutput(outputId = "data_summary"),
    dataTableOutput(outputId = "data_table")
)
server <- function(input, output, session) {
    dataset <- reactive({
        get(input$user_data, "package:datasets")
    })

    output$data_summary <- renderPrint({
        summary(dataset())
    })

    output$data_table <- renderDataTable({
        dataset()
    })
}
shinyApp(ui, server)
