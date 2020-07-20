#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    securityData <- read.csv("CampusSecurity.csv", header = TRUE);
    securityData$Incident.Type = as.factor(securityData$Incident.Type);
    
    
    if (input$Data == "Map Data") {
        output$HomewoodMap <-renderLeaflet ({
            HomewoodMap <- leaflet()%>% addTiles %>% addCircles(lng =-76.6210509, lat = 39.3292721, popup = "JHU Homewood Campus", radius = 520)  
        })
        output$InnerharborMap <-renderLeaflet ({
            InnerharborMap <- leaflet()%>% addTiles %>% addCircles(lng =-76.6015338, lat = 39.2826004, popup = "JHU Inner Harbor Campus", radius = 90)
        })
        output$WashingtonMap <-renderLeaflet ({
            WashingtonMap <- leaflet()%>% addTiles %>% addCircles(lng =-77.0389059, lat = 38.9080949, popup = "JHU Washington D.C. Campus", radius = 90)
        })
        output$JHHMap <-renderLeaflet ({
            JHHMap <- leaflet()%>% addTiles %>% addCircles(lng =-76.5931948, lat = 39.2973603, popup = "Johns Hopkins Hospital", radius = 400)
        })
    }
    
    if (input$Time == "All Time") {
        output$HomewoodMap <-renderLeaflet ({
            HomewoodMap <- leaflet()%>% addTiles %>% addCircles(lng =-76.6210509, lat = 39.3292721, popup = "JHU Homewood Campus", radius = 520)
                            %>% addAwesomeMarkers(lng = securityData$Longtitude, lat = securityData$Latitude, popup = securityData$Location)
        })
    }
    
    
    
})

