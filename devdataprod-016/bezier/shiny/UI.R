setwd("~/R/coursera/devdataprod-016/bezier/shiny")
library(shiny)

shinyUI(fluidPage(
titlePanel(title=h4("Bezier Curve",align="center")),
sidebarLayout(
  sidebarPanel(
    h3("Position Control"),
    p("You can move the top green point by moving the sliders."),
    sliderInput("vert" ,"vertical position",min=0,max=10,value=5),
    sliderInput("horiz","horizontal position",min=0,max=10,value=7)),

  mainPanel(h3(""),
    p("The quadratic bezier curve is used in computer fonts and graphics among other things."),
    p("In 3D printing a cad drawing is converted to a text file of g codes to send to the printer.
      The bezier curves from fonts and other items must be converted to arcs of circles. The radius
      of curvature of the curve at appropiate points is calculated and included in the g codes. The
      molten plastic is extruded like toothpaste in segments of lines and arcs layer by layer until
      the object is produced."),
    p("The bezier curve is interesting in that it takes a higher percentage of the starting line and
      adds it to a small percentage of the ending line as it starts out. Then as the curve proceeds
      it takes a smaller percentage of the beginning line and more of the ending line until the end
      point where it is 100% using the final line. Thus only two straight lines are needed to form
      almost any curve. The lines are shown in the graph below. See the wikipedia artical for more info.
      http://en.wikipedia.org/wiki/Bezier_curve"),
  #          textOutput("myy"),
  #          textOutput("myx"),
            plotOutput("myplot")
  )
)))

