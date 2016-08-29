library(shiny)
library("xlsx")
library(reshape2)
df <- read.xlsx("Helpline.xlsx", 2, header = TRUE)
#df$NA. <- as.character(df$NA.)
df[is.na(df)] <- 0
# Define server logic for slider examples
shinyServer(function(input, output) {
  
  sliderMonth <- reactiveValues()
  observe({
    full.date <- as.POSIXct(input$slider, tz="GMT")
    query <- as.character(format(full.date, "%Y-%m-%d"))
    #print(query)
    result <- subset(df, df$NA.==query,)
    print(result)
    #print(subset(df, df$NA.=="2015-07-01",))
    #resultLong <- melt(result, id.vars = "NA.",value.name = "value")
    #print(sliderMonth$Month)
  })
  
  output$SliderText <- renderText({sliderMonth$Month})
  output$BBplot <- renderPlot({
    d <- data()
    plot(d$speed, d$dist)
  })
})
