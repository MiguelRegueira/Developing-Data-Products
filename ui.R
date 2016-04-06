#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Locations of Earthquakes off Fiji"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      p("This app shows the earth quakes of richter magnitude bigger than 4 occurred near Fiji since 1964. The data is presented in a map and a scatter plot and the data can be filtered with the following controls: "),
       sliderInput("bins","Number of bins:",
                   min = 2,max = 10,value = 4),
       sliderInput("magFilter","Richter Magnitude Range:",
                   min = 4, max = 6.4, value = c(4,7), step = 0.1),
       sliderInput("depthFilter","Earthquake depth:",
                   min = 40, max = 680, value = c(4,7), step = 10),
       sliderInput("stationsFilter","Number of stations observed the quake:",
                   min = 10, max = 140, value = c(4,7), step = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      leafletOutput("mapPlot"),
      plotOutput("corr")
    )
  )
))
