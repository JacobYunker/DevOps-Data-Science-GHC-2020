library(shiny)
library(tidyverse)

housing<-read.csv("BostonHousing.csv", header=TRUE)

ui<-fluidPage(

    titlePanel("Boston Housing Data"),

    sidebarLayout(
        sidebarPanel(
            h4("Filter"),
            selectInput(inputId = "y",
                label = "Y-Axis:", 
                choices = c("crim","zn","indus","chas","nox","rm","age","dis","rad","tax","ptratio","b","lstat","medv"),
                selected = "rm"),
            selectInput(inputId = "x",
                label = "X-Axis:", 
                choices = c("crim","zn","indus","chas","nox","rm","age","dis","rad","tax","ptratio","b","lstat","medv"),
                selected = "medv"),
            h6("CRIM: Per capita crime rate by town"),
            h6("ZN: Proportion of residential land zoned for lots over 25,000 sq. ft"),
            h6("INDUS: Proportion of non-retail business acres per town"),
            h6("CHAS: Charles River dummy variable (= 1 if tract bounds river; 0 otherwise)"),
            h6("NOX: Nitric oxide concentration (parts per 10 million)"),
            h6("RM: Average number of rooms per dwelling"),
            h6("AGE: Proportion of owner-occupied units built prior to 1940"),
            h6("DIS: Weighted distances to five Boston employment centers"),
            h6("RAD: Index of accessibility to radial highways"),
            h6("TAX: Full-value property tax rate per $10,000"),
            h6("PTRATIO: Pupil-teacher ratio by town"),
            h6("B: 1000(Bk — 0.63)², where Bk is the proportion of [people of African American descent] by town"),
            h6("LSTAT: Percentage of lower status of the population"),
            h6("MEDV: Median value of owner-occupied homes in $1000s")
        ),

        mainPanel(
        plotOutput("scatterPlot")
        )
    )
)

server<-function(input,output){
    output$scatterPlot<-renderPlot({
        ggplot(housing)+
        geom_point(aes_string(x=input$x,y=input$y))
    })
}

shinyApp(ui=ui, server=server)
