#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Making a Model Based On Points"),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
           h3("Intercept"),
           textOutput("intOut"),
           h3("Slope"),
           textOutput("slopOut"),
           h6("Choose points on the plot, then push execute button to make a linear model"),
           submitButton("Execute")
        ),
        mainPanel(
            plotOutput("plot1", brush = brushOpts(id = "brush1"))
        )
    )
))
