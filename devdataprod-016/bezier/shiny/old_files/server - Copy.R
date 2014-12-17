library(shiny)
pts=matrix(c(2,2,4,8,8,5),nrow=3,byrow=T)
my_app=function(vx,h,v2){
    if(vx=="red"  ){pts[1,1]<<-h;pts[1,2]<<-v2}
    if(vx=="green"){pts[2,1]<<-h;pts[2,2]<<-v2}
    if(vx=="blue" ){pts[3,1]<<-h;pts[3,2]<<-v2}}

shinyServer(
  function(input,output){
    output$myplot=renderPlot({my_y=1;my_app(input$vertex,input$horiz,input$vert);
                              plot(pts,col=c("red","green","blue"),type="b",
                                   xlim=c(0,10),ylim=c(0,10));y=3})
    output$s1=renderText(some)  
    output$myvertex=renderText(switch(input$vertex,"red"=1,"green"=2,"blue"=3))
    output$myy     =renderText(input$vert)
    output$myx     =renderText(input$horiz)

  }
)


