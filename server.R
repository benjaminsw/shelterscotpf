library(shiny)
library("xlsx")
df <- read.xlsx("Helpline.xlsx", 2, header = TRUE)
df$NA. <- as.character(df$NA.)
df[is.na(df)] <- 0
# Define server logic for slider examples
shinyServer(function(input, output) {
  
  sliderMonth <- reactiveValues()
  observe({
    full.date <- as.POSIXct(input$slider, tz="GMT")
    sliderMonth$Month <- as.character(monthStart(full.date))
    #query <- as.character(format(full.date, "%Y-%m"))
    result <- subset(df, df$NA.==sliderMonth$Month,)
    print(result)
  })
  
  output$SliderText <- renderText({sliderMonth$Month})
})
