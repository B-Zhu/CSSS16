library(leaflet)


########################### main function ############################

shinyServer(function(input,output) {
  
  #Render selection
  dfSelection <- reactive(subset(dataframe, start_year == input$year))
                                               
  
  #Map
  output$HistoryEvent <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      setView(lng = 15, lat = 50, zoom = 2) %>%
      
      #Markers 
      addMarkers(lng = dfSelection()$Lon,
                 lat = dfSelection()$Lat, 
                 clusterOptions = markerClusterOptions(),
                 
                 #Popups
                 popup = paste(strong("Event: "), dfSelection()$type, br(),
                               strong("Year: "), dfSelection()$start_year, br(),
                               br(),
                               strong("Magnitude: "), dfSelection()$magnitude, br(),
                               strong("Description: "), dfSelection()$description, br()
                                ) 
                )
  })
})