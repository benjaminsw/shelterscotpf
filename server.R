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
    query <- as.character(format(full.date, "%Y-%m-01"))
    #print(query)
    result <- subset(df, df$NA.==query,)
    #print(result)
    resultLong <- melt(result, id.vars = "NA.",value.name = "value")
    print(resultLong)
  })
  output$BBplot <- renderPlot({
    ggplot(resultLong, aes(x=variable, y=NA., size = value, fill = value)) + 
      geom_point(shape = 21) + ylab("Year-Month-Date")+xlab("Matrices") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
  },width=2000,height=1000)
})
