
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(navbarPage("EU Stock Market Data", 
  tabPanel("Documentation", 
           fluidRow(column(12, 
             includeMarkdown("documentation.md")))), 
  tabPanel("Model", 
    sidebarLayout(
      sidebarPanel(
        dateRangeInput("daterange", "Date range:",
                       start = "1991-01-01",
                       end   = "1998-12-31", 
                       min = "1991-01-01", 
                       max = "1998-12-31", 
                       startview = 'year'), 
        selectInput("market", "Variable:",
                    c("DAX" = "DAX",
                      "SMI" = "SMI",
                      "CAC" = "CAC", 
                      "FTSE" = "FTSE"))
      ),
  
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("mktPlot"), 
        textOutput("modelsummary")
      )
    )
  )
))
