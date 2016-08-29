
# Define UI for slider demo application
shinyUI(
  pageWithSidebar(
    headerPanel("Shelter Scotland Data"),
    sidebarPanel(
      sliderInput("slider", "Time", min = as.Date("2015-07-01"),max =as.Date("2016-06-01"),value=as.Date("2015-07-01"),timeFormat="%b %Y", animate=TRUE)
    ),
    mainPanel(
      plotOutput("BBplot")
    )
  )
  
)
