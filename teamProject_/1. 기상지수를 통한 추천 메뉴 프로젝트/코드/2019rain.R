library(ggplot2)

setwd("E:\\project\\weather")
getwd()

data2019=read.csv("2019weather.csv")
#data2019
#강원도---------------------------------------------------------------------------------------


for(i in 1:6){
title = paste("2019년 ",i," 월 강원도 강수량",sep="")
if(i<10){
name=paste("0",i,".png",sep="")
}else{
name=paste(i,".png",sep="")
}


Gangwondo2019=subset(data2019,loc=="강원도" & month==i)
rain2019=data.frame(day=Gangwondo2019$day,rain=Gangwondo2019$rain)
ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))


ggsave(file=name)
}

#서울-----------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 서울 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
Seoul2019=subset(data2019,loc=="서울" & month==i)
rain2019=data.frame(day=Seoul2019$day,rain=Seoul2019$rain)
ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))


ggsave(file=name)
}

#인천-----------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 인천 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Incheon2019=subset(data2019,loc=="인천" & month==i)
  rain2019=data.frame(day=Incheon2019$day,rain=Incheon2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#경기도---------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 경기도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Gyeonggi2019=subset(data2019,loc=="경기도" & month==i)
  rain2019=data.frame(day=Gyeonggi2019$day,rain=Gyeonggi2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#충청북도-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 충청북도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Chungcheongbuk2019=subset(data2019,loc=="충청북도" & month==i)
  rain2019=data.frame(day=Chungcheongbuk2019$day,rain=Chungcheongbuk2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#충청남도-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 충청남도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Chungcheongnam2019=subset(data2019,loc=="충청남도" & month==i)
  rain2019=data.frame(day=Chungcheongnam2019$day,rain=Chungcheongnam2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#전라북도-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 전라북도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Jeonbuk2019=subset(data2019,loc=="전라북도" & month==i)
  rain2019=data.frame(day=Jeonbuk2019$day,rain=Jeonbuk2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#전라남도-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 전라남도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Jeonnam2019=subset(data2019,loc=="전라남도" & month==i)
  rain2019=data.frame(day=Jeonnam2019$day,rain=Jeonnam2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#경상북도-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 경상북도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Kyungbuk2019=subset(data2019,loc=="경상북도" & month==i)
  rain2019=data.frame(day=Kyungbuk2019$day,rain=Kyungbuk2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}
#경상남도-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 경상남도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Kyungnam2019=subset(data2019,loc=="경상남도" & month==i)
  rain2019=data.frame(day=Kyungnam2019$day,rain=Kyungnam2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#부산-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 부산 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Busan2019=subset(data2019,loc=="부산" & month==i)
  rain2019=data.frame(day=Busan2019$day,rain=Busan2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#대구-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 대구 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Daegu2019=subset(data2019,loc=="대구" & month==i)
  rain2019=data.frame(day=Daegu2019$day,rain=Daegu2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#광주-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 광주 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Gwangju2019=subset(data2019,loc=="광주" & month==i)
  rain2019=data.frame(day=Gwangju2019$day,rain=Gwangju2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#대전-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 대전 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Daejeon2019=subset(data2019,loc=="대전" & month==i)
  rain2019=data.frame(day=Daejeon2019$day,rain=Daejeon2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#울산-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 울산 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Ulsan2019=subset(data2019,loc=="울산" & month==i)
  rain2019=data.frame(day=Ulsan2019$day,rain=Ulsan2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#제주도-------------------------------------------------------------------------------------
for(i in 1:6){
  title = paste("2019년 ",i," 월 제주도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Jeju2019=subset(data2019,loc=="제주도" & month==i)
  rain2019=data.frame(day=Jeju2019$day,rain=Jeju2019$rain)
  ggplot(rain2019, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}