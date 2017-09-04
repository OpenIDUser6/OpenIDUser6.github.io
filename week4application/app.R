#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)

# Define UI for different gaphs
ui=shinyUI(fluidPage(
    # Application title
    titlePanel("Different graphs"),
    sidebarLayout(
        # Left panel with option of graphs
        sidebarPanel(
            h1("Choose one of the graph type"),
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
      
data("iris")
##check the information about the dataset
head(iris)
##remove the last charactor variable variable and change to matrix
iris1=as.matrix(iris[,-5])
##create shiny server
server=shinyServer(function(input, output)
    output$plot1 <- renderPlot({
        ##if the boxplot is chosen, the boxplot will be made
        if (input$boxplot) {
            boxplot(iris1)
        }
        ##if the correlationPlot is chosen, the correlation plot will be made
        if (input$correlationPlot) {
            featurePlot(x=iris[,1:4],y=iris[,5],plot="pairs")
        }
    })
)

# Run the application 
shinyApp(ui = ui, server = server)

