## LIBD rstats club 2020-08-28
## https://docs.google.com/document/d/1bsq-1FfHkgoviECdhlA594T_G-kA2B88JMI5485Z4E4/edit?usp=sharing
library("shiny")

## From https://shiny.rstudio.com/articles/basics.html

# Define UI for app that draws a histogram ----
ui <- fluidPage(

    # App title ----
    titlePanel("Hello Shiny!"),

    # Sidebar layout with input and output definitions ----
    sidebarLayout(

        # Sidebar panel for inputs ----
        sidebarPanel(

            # Input: Slider for the number of bins ----
            sliderInput(inputId = "histogram_bins",
                        label = "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)

        ),

        # Main panel for displaying outputs ----
        mainPanel(

            # Output: Histogram ----
            plotOutput(outputId = "eruption_histogram")

        )
    )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {

    # Histogram of the Old Faithful Geyser Data ----
    # with requested number of bins
    # This expression that generates a histogram is wrapped in a call
    # to renderPlot to indicate that:
    #
    # 1. It is "reactive" and therefore should be automatically
    #    re-executed when inputs (input$histogram_bins) change
    # 2. Its output type is a plot
    output$eruption_histogram <- renderPlot({

        x    <- faithful$waiting
        bins <- seq(min(x), max(x), length.out = input$histogram_bins + 1)

        hist(x, breaks = bins, col = "#75AADB", border = "white",
             xlab = "Waiting time to next eruption (in mins)",
             main = "Histogram of waiting times")

    })

}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
library(shiny)
ui <- fluidPage(
    "Hello, world!"
)
server <- function(input, output, session) {
}
shinyApp(ui, server)

