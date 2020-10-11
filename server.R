library(shiny)

shinyServer(function(input, output) {
    model <- reactive ({
        brushed_data<- brushedPoints(mtcars, input$brush1, xvar = "hp", yvar = "mpg")
        if(nrow(brushed_data) < 2) {
            return (NULL)
        }
        brushed_data$hpsp<- ifelse(brushed_data$hp - 2000 > 0, brushed_data$hp - 2000, 0 )
        lm(mpg ~ hp + hpsp, data = brushed_data)
    })
  output$slopOut<- renderText({
      if(is.null(model())) { 
          "No cars selected"
      } else {
              model()[[1]][2]
      }
  })
  output$intOut <- renderText ({ 
      if(is.null(model())) { 
      "No cars selected"
  } else {
      model()[[1]][1]
  }})
 output$plot1 <- renderPlot({
     plot(mtcars$hp, mtcars$mpg, xlab = "Horse power", ylab = "Miles per galon", main = "Miles per galon based on horse power",
          cex = 2, pch =20, bty ="n", ylim = c(0,35), xlim = c(40, 350))
     if(!is.null(model())){
         abline(model(), col = "blue", lwd =3)
     }
 })
  
})

