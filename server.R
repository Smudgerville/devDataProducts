
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny); library(tseries); require(lubridate)

shinyServer(function(input, output) {

  output$mktPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    # x    <- faithful[, 2]
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
    # RMS Work
    # plotSeries <- EuStockMarkets[,input$market]
    plotSeries <- window(EuStockMarkets[,input$market], start = c(year(input$daterange[1]), month(input$daterange[1])), end = c(year(input$daterange[2]), month(input$daterange[2])))
    
    #modelSeries <- 
    
    plot(plotSeries, type = "l", ylab = "Closing Price", main = paste("Daily Closing Prices for the", input$market, "index"))
    lines(predict(garch(plotSeries))[,1], col = "red", lty = 2)
    legend(x = "topleft", legend = c("Actual", "GARCH Model"), lty = c(1, 2), col = c("black", "red"))
  })
  
})
