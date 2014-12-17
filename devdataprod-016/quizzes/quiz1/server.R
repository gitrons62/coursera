setwd("~/R/coursera/devdataprod-016/quizzes")

shinyServer(function(input,output){
  output$myname=renderText(input$name)
  output$myn2  =renderText(input$n2)
  output$mygender=renderText(input$gender)
  output$myslide1=renderText(paste("value is:",input$slide1))
  
  }
)

