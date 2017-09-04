library(shiny)
library(caret)
data("iris")
##check the information about the dataset
head(iris)
##remove the last charactor variable variable and change to matrix
iris1=as.matrix(iris[,-5])
##create shiny server
shinyServer(function(input, output)
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

