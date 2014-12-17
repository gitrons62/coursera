library(shiny)
pts=matrix(c(2,1,5,7,8,3),nrow=3,byrow=T)
bp=matrix(,11,2)
t=(0:10)/10
bt0=function(t){(1-t)*((1-t)*pts[1,]+t*pts[2,])+
                   t *((1-t)*pts[2,]+t*pts[3,])}

mbt0=function(){for(i in 0:10){bp[i+1,1]<<-bt0(i/10)[1];bp[i+1,2]<<-bt0(i/10)[2]}}

my_app=function(h,v2){pts[2,1]<<-h;pts[2,2]<<-v2;mbt0()}
my_plot=function(){plot(pts,col=c("red","green","blue"),type="b",
                        xlim=c(0,10),ylim=c(0,10))
                   points(bp)}

shinyServer(
  function(input,output){
    output$myplot=renderPlot({my_app(input$horiz,input$vert);my_plot()})
    output$myy     =renderText(input$vert)
    output$myx     =renderText(input$horiz)

  }
)


