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

shinyUI(fluidPage(

    # Application title
    titlePanel("Johns Hopkins Campus Security Map"),

    sidebarLayout(
        sidebarPanel(
            selectInput("Time", "Incident Time", c("Last 5 Days", "Last 30 Days", "Last 3 Months", "Last Year", "All Time")),
            selectInput("Type", "Incident Type", c("armed robbery", "unarmed robbery", "armed carjacking", "unarmed carjacking", "harassing", "All Types")),
            selectInput("Data", "Graphic Data Type", c("Map Data", "Overall Trend", "Categorize By Area at Homewood")),
            submitButton("Submit")
        ),

        mainPanel(
            tabsetPanel(type = "tabs", 
                        tabPanel("Homewood", leafletOutput("HomewoodMap")), 
                        tabPanel("Inner Harbor", leafletOutput("InnerharborMap")), 
                        tabPanel("Washington D.C.", leafletOutput("WashingtonMap")),
                        tabPanel("Johns Hopkins Hospital", leafletOutput("JHHMap"))
        )
    )
)))
