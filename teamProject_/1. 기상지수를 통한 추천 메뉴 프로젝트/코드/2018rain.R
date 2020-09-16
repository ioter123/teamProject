library(ggplot2)

setwd("E:\\project\\weather")
getwd()

data2018=read.csv("2018weather.csv")
#data2018
#강원도---------------------------------------------------------------------------------------


for(i in 1:12){
  title = paste("2018년 ",i," 월 강원도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  
  
  Gangwondo2018=subset(data2018,loc=="강원도" & month==i)
  rain2018=data.frame(day=Gangwondo2018$day,rain=Gangwondo2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#서울-----------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 서울 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Seoul2018=subset(data2018,loc=="서울" & month==i)
  rain2018=data.frame(day=Seoul2018$day,rain=Seoul2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#인천-----------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 인천 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Incheon2018=subset(data2018,loc=="인천" & month==i)
  rain2018=data.frame(day=Incheon2018$day,rain=Incheon2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#경기도---------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 경기도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Gyeonggi2018=subset(data2018,loc=="경기도" & month==i)
  rain2018=data.frame(day=Gyeonggi2018$day,rain=Gyeonggi2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#충청북도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 충청북도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Chungcheongbuk2018=subset(data2018,loc=="충청북도" & month==i)
  rain2018=data.frame(day=Chungcheongbuk2018$day,rain=Chungcheongbuk2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#충청남도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 충청남도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Chungcheongnam2018=subset(data2018,loc=="충청남도" & month==i)
  rain2018=data.frame(day=Chungcheongnam2018$day,rain=Chungcheongnam2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#전라북도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 전라북도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Jeonbuk2018=subset(data2018,loc=="전라북도" & month==i)
  rain2018=data.frame(day=Jeonbuk2018$day,rain=Jeonbuk2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#전라남도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 전라남도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Jeonnam2018=subset(data2018,loc=="전라남도" & month==i)
  rain2018=data.frame(day=Jeonnam2018$day,rain=Jeonnam2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#경상북도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 경상북도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Kyungbuk2018=subset(data2018,loc=="경상북도" & month==i)
  rain2018=data.frame(day=Kyungbuk2018$day,rain=Kyungbuk2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}
#경상남도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 경상남도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Kyungnam2018=subset(data2018,loc=="경상남도" & month==i)
  rain2018=data.frame(day=Kyungnam2018$day,rain=Kyungnam2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#부산-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 부산 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Busan2018=subset(data2018,loc=="부산" & month==i)
  rain2018=data.frame(day=Busan2018$day,rain=Busan2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#대구-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 대구 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Daegu2018=subset(data2018,loc=="대구" & month==i)
  rain2018=data.frame(day=Daegu2018$day,rain=Daegu2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#광주-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 광주 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Gwangju2018=subset(data2018,loc=="광주" & month==i)
  rain2018=data.frame(day=Gwangju2018$day,rain=Gwangju2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#대전-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 대전 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Daejeon2018=subset(data2018,loc=="대전" & month==i)
  rain2018=data.frame(day=Daejeon2018$day,rain=Daejeon2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}

#울산-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 울산 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Ulsan2018=subset(data2018,loc=="울산" & month==i)
  rain2018=data.frame(day=Ulsan2018$day,rain=Ulsan2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}


#제주도-------------------------------------------------------------------------------------
for(i in 1:12){
  title = paste("2018년 ",i," 월 제주도 강수량",sep="")
  if(i<10){
    name=paste("0",i,".png",sep="")
  }else{
    name=paste(i,".png",sep="")
  }
  Jeju2018=subset(data2018,loc=="제주도" & month==i)
  rain2018=data.frame(day=Jeju2018$day,rain=Jeju2018$rain)
  ggplot(rain2018, aes(x=day, y=rain)) + geom_bar(color="grey",size=1,stat = "identity",fill='DodgerBlue')+ ggtitle(title) + theme(plot.title=element_text(size=20, vjust=2, face="bold.italic")) +  geom_text(aes(label=rain), vjust=-1, colour="black", na.rm = TRUE)+ scale_x_continuous(breaks=seq(0, 31, 2))
  
  
  ggsave(file=name)
}
