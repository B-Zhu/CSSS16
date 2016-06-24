#libraries
library(shiny)
library(leaflet)

######################### Constant variables #########################

#load dataframe and construct some necessary variables
dataframe <- read.csv("Earthquake.csv", stringsAsFactors=FALSE)

########################### main function ############################

shinyUI(bootstrapPage(
  
  #Somehow this line turns out necessary for outputting a full-screen map
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  
  #MAP
  leafletOutput("HistoryEvent", width = "100%", height = "100%"),
  
  #FILTERING OPTIONS MENU
  absolutePanel(
    
    #some general settings
    class = "panel panel-default",
    top = 0, 
    right = 0,
    width = 350, 
    height = "100%",
    align = "center",
    
    #title of the menu
    h2("Filtering options"),
    br(),
    
    
    #filtering options are down here
    sliderInput("year", 
                label = "Year of the Event", 
                min = 1900, 
                max = 1920, 
                step = 1,
                value = 1900
    
    #closing brackets

))))