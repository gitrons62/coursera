setwd("~/R/coursera/devdataprod-016/quizzes")
library(shiny)
shinyUI(fluidPage(
  titlePanel(title="first shiny"),
  sidebarLayout(position="right",
  sidebarPanel(h3("this is side bar"),
               h4("line 2"),
               textInput("name","enter name",""),
               textInput("n2","enter age",""),
               radioButtons("gender","input gender",
                            list("male","female"),""),
               sliderInput("slide1","select slider",min=0,max=5,value=2)),
  mainPanel(h4("this is the main panel"),
            h6("line 2"),
            textOutput("myname"),
            textOutput("myn2"),
            textOutput("mygender"),
            
            textOutput("myslide1"))
  )
  ))
  
  

