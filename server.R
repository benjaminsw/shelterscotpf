library(shiny)
library(ggplot2)
library("xlsx")
library(reshape2)
df <- read.xlsx("Helpline.xlsx", 2, header = TRUE)
df[is.na(df)] <- 0
# Define server logic for slider examples
shinyServer(function(input, output) {
  output$barPlot <- renderPlot({
      full.date <- as.POSIXct(input$slider, tz="GMT")
      query <- as.character(format(full.date, "%Y-%m-01"))
      result <- subset(df, df$NA.==query,)
      resultLong <- melt(result, id.vars = "NA.",value.name = "value")
    ggplot(resultLong, aes(x=variable, y=value)) + 
      geom_bar(stat="identity", fill="steelblue") + ylab("Value")+xlab("Matrices") +
      geom_text(aes(label=value),angle = 90, hjust = 2, color="white", size=12) +
      theme(axis.text.x = element_text(angle = 80, hjust = 1, size=24),
            axis.text.y = element_text(angle = 90, hjust = 1, size=24),
            axis.title=element_text(size=24,face="bold"))
    
  },width=4000,height=2000)
  output$table <- renderDataTable({
    df
  })
  output$summary <- renderText({
    "I went to Hackathon on 29 July 2016 to 31 July 2016 at CodeBase which the theme was 'homelessness' and there was data provided by Shelter. As a data lover, I can stopped to dig down and see this data. Here are the example of what I decided to build and make it public. Though, my team did not win but we had fun and know a lot more about housing problem in Scotland and met a lot of amezing people <3"
  })
})
