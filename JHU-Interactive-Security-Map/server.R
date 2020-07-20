library(shiny)


shinyServer(function(input, output) {
    securityData <- read.csv("/Users/b.w.h/Documents/R/JHU-Interactive-security-Map/CampusSecurity.csv", header = TRUE);
    securityData$Incident.Type = as.factor(securityData$Incident.Type);
    
    getColor <- function(securityData) {
        sapply (securityData$Incident.Type, function(Incident.Type) {
            if (Incident.Type == "armed robbery") {
                "red";
            }
            else if (Incident.Type == "armed carjacking") {
                "red"
            }
            else if (Incident.Type == "unarmed robbery") {
                "orange";
            }
            else if (Incident.Type == "unarmed carjacking") {
                "orange"
            }
            else if (Incident.Type == "harassing") {
                "blue";
            }
        })
    }
    icons <- awesomeIcons(
        icon = 'ios-close',
        iconColor = 'black',
        library = 'ion',
        markerColor = getColor(securityData)
    )
    
    
    dataTypeSelect <- reactive({
        dataTypeSelect <- parse(text=as.character(input$Data))
        return (dataTypeSelect)
    })
    
    output$HomewoodMap <-renderLeaflet ({
        HomewoodMap <- leaflet() %>% addTiles %>% addAwesomeMarkers(lng = securityData$Longtitude, lat = securityData$Latitude, popup = securityData$Description, icon=icons) %>% addTiles %>% addCircles(lng =-76.6210509, lat = 39.3292721, popup = "JHU Homewood Campus", radius = 520)
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
    
    
    
})

