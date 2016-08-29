library(shiny)
library("xlsx")
df <- read.xlsx("Helpline.xlsx", 2, header = TRUE)
# Define server logic for slider examples
shinyServer(function(input, output) {
  
  # Reactive expression to compose a data frame containing all of the values
  sliderValues <- reactive({
    
    
  }) 
  
  # Show the values using an HTML table
  output$values <- renderTable({
    sliderValues()
  })
})
