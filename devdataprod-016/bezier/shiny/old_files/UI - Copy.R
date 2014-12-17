setwd("~/R/coursera/devdataprod-016/bezier/shiny")
library(shiny)



shinyUI(fluidPage(
titlePanel(title=h4("Bezier Curve",align="center")),
sidebarLayout(
  sidebarPanel(
    selectInput("vertex","select vertex to move",choices=c("red","green","blue")),
    sliderInput("vert" ,"select y",min=0,max=10,value=2),
    sliderInput("horiz","select x",min=0,max=10,value=2)),

  mainPanel(
            textOutput("myvertex"),
            textOutput("myy"),
            textOutput("myx"),
            plotOutput("myplot")
  )
)))

