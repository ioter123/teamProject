library(ggplot2)

setwd("E:\\project\\weather")
getwd()

data2017=read.csv("2017weather.csv")
#data2017
#강원도---------------------------------------------------------------------------------------


for(i in 1:12){
  title = paste("2017년 ",i," 월 강원도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  
  
  Gangwondo2017=subset(data2017,loc=="강원도" & month==i)
  rain2017=data.frame(day=Gangwondo2017$day,rain=Gangwondo2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#서울-----------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 서울 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Seoul2017=subset(data2017,loc=="서울" & month==i)
  rain2017=data.frame(day=Seoul2017$day,rain=Seoul2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#인천-----------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 인천 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Incheon2017=subset(data2017,loc=="인천" & month==i)
  rain2017=data.frame(day=Incheon2017$day,rain=Incheon2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#경기도---------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 경기도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Gyeonggi2017=subset(data2017,loc=="경기도" & month==i)
  rain2017=data.frame(day=Gyeonggi2017$day,rain=Gyeonggi2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#충청북도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 충청북도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Chungcheongbuk2017=subset(data2017,loc=="충청북도" & month==i)
  rain2017=data.frame(day=Chungcheongbuk2017$day,rain=Chungcheongbuk2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#충청남도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 충청남도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Chungcheongnam2017=subset(data2017,loc=="충청남도" & month==i)
  rain2017=data.frame(day=Chungcheongnam2017$day,rain=Chungcheongnam2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#전라북도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 전라북도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Jeonbuk2017=subset(data2017,loc=="전라북도" & month==i)
  rain2017=data.frame(day=Jeonbuk2017$day,rain=Jeonbuk2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#전라남도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 전라남도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Jeonnam2017=subset(data2017,loc=="전라남도" & month==i)
  rain2017=data.frame(day=Jeonnam2017$day,rain=Jeonnam2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#경상북도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 경상북도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Kyungbuk2017=subset(data2017,loc=="경상북도" & month==i)
  rain2017=data.frame(day=Kyungbuk2017$day,rain=Kyungbuk2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}
#경상남도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 경상남도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Kyungnam2017=subset(data2017,loc=="경상남도" & month==i)
  rain2017=data.frame(day=Kyungnam2017$day,rain=Kyungnam2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#부산-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 부산 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Busan2017=subset(data2017,loc=="부산" & month==i)
  rain2017=data.frame(day=Busan2017$day,rain=Busan2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#대구-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 대구 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Daegu2017=subset(data2017,loc=="대구" & month==i)
  rain2017=data.frame(day=Daegu2017$day,rain=Daegu2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#광주-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 광주 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Gwangju2017=subset(data2017,loc=="광주" & month==i)
  rain2017=data.frame(day=Gwangju2017$day,rain=Gwangju2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#대전-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 대전 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Daejeon2017=subset(data2017,loc=="대전" & month==i)
  rain2017=data.frame(day=Daejeon2017$day,rain=Daejeon2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#울산-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 울산 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Ulsan2017=subset(data2017,loc=="울산" & month==i)
  rain2017=data.frame(day=Ulsan2017$day,rain=Ulsan2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#제주도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2017년 ",i," 월 제주도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Jeju2017=subset(data2017,loc=="제주도" & month==i)
  rain2017=data.frame(day=Jeju2017$day,rain=Jeju2017$rain)
  ggplot(rain2017, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}
