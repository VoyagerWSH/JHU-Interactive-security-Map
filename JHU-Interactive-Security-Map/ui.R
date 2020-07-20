library(shiny)
library(leaflet)

shinyUI(fluidPage(

    # Application title
    titlePanel("Johns Hopkins Campus Security Map"),

    sidebarLayout(
        sidebarPanel(
            selectInput("Time", "Incident Time", c("Within 5 Days", "Within 30 Days", "Within 3 Months", "Within a Year", "All Time")),
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
