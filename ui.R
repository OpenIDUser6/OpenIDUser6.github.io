library(shiny)
# Define UI for different gaphs
shinyUI(fluidPage(
    # Application title
    titlePanel("Different graphs"),
    sidebarLayout(
        # Left panel with option of graphs
        sidebarPanel(
            #choose one of the graphs to visualize the data
            checkboxInput("correlationPlot","Show/Hide correlationPlot", value=TRUE),
            checkboxInput("boxplot", "Show/Hide boxplot", value=TRUE)
        ),
        # Right panel with the graph chosen
        mainPanel(
            h3("Graph of iris dataset"),
            plotOutput("plot1")
        )
    )
))
