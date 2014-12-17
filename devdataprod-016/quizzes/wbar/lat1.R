setwd("~/R/coursera/devdataprod-016/quizzes/wbar")
library(xlsx)
x_data=read.xlsx("EXP97_all_Trp_mets_DAD.xlsx",1,stringsAsFactors=FALSE)
x_data$Area=as.numeric(x_data$Area)
x_data[is.na(x_data$Area),3]=0
(x=strsplit(x_data[,1],"_"))
col3=NULL;col4=NULL
for(i2 in 1:750){
                 col3[i2]=unlist(x[i2])[3];
                 col4[i2]=unlist(x[i2])[4]}
new_x=data.frame(col2=factor(x_data[,2]),col3=col3,col4=col4,Area=x_data$Area)


library(lattice)

bwplot(Area~col4|col3+col2,data=new_x,do.out=F,ylim=c(0,60000))
barchart(Area~col4|col3,data=new_x[1:150,],group=col3)
# boxplot(Area~col4+col3,data=new_x,outline=F)

mychart=function(...){
  panel.barchart(...)
  }

barchart(Area~col4|col3,data=new_x[1:50,],scales="free",
         panel=mychart,group=col2,layout=c(3,4))


barchart(Area~col4|col3*col2,data=new_x[1:50,],scales="free",
         panel=mychart,group=col2,layout=c(5,4))

barchart(Area~col4|col3,data=new_x[1:50,],
         scale="free",colour=col4)

barplot(Area~col4|col3,data=new_x[1:50,],
         scale="free",colour=col4)
#########

library(ggplot2)

ggplot(new_x,aes(col4,log(Area),color=col4))+geom_bar(stat="identity")

g=ggplot(new_x,aes(col4,log(Area),color=col4))+geom_bar(stat="identity")
g+facet_grid(col3~col2)
