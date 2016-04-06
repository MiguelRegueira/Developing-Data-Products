#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(ggplot2)
library(gridExtra)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  colorpal <- reactive({
    colorBin(palette = "YlOrRd", domain = quakes$mag, bins = input$bins)
  })
  
  filteredQuakes <- reactive({
    quakes[quakes$mag >= input$magFilter[1] & quakes$mag <= input$magFilter[2] & quakes$depth >= input$depthFilter[1] & quakes$depth <= input$depthFilter[2] & quakes$stations >= input$stationsFilter[1] & quakes$stations <= input$stationsFilter[2],]
  })
  
  output$mapPlot <- renderLeaflet({

    pal <- colorpal()
    leaflet(data = filteredQuakes()) %>%
      addTiles() %>%
      addCircleMarkers(
        lng = ~long, lat = ~lat,
        popup = ~paste("<b>Depth (km): </b>", depth,
                       "<br/><b>Magnitude (Richter Magnitude): </b>", mag,
                       "<br/><b>Number stations: </b>", stations, "%",sep=""),
        color = ~pal(mag),
        stroke = FALSE, fillOpacity = 0.85
      ) %>%
      addLegend("bottomright", values = ~mag, pal = pal,
                title = "Earthquake Richter Magnitude",
                labFormat = labelFormat(suffix = "%"),
                opacity = 1
      )
    
  })
  
  output$corr <- renderPlot({
    data <- filteredQuakes()
    plot1 <- ggplot(data) +
      geom_jitter(aes(data$mag, data$depth), height = 0.4, width = 0.4, alpha = 0.5, color = "blue") +
      xlab("Magnitude (Richter)") +
      ylab('Earthquake depth (km)') +
      ggtitle('Earthquake magnitude Vs depth')
    plot2 <- ggplot(data) +
      geom_jitter(aes(data$mag, data$stations), height = 0.4, width = 0.4, alpha = 0.5, color = "blue") +
      xlab("Magnitude (Richter)") +
      ylab('Number of stations (#)') +
      ggtitle('Earthquake magnitude Vs number of stations')
    grid.arrange(plot1, plot2, ncol=2)
  })
  
})
