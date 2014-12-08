pollutantmean<-function(directory, pollutant, id=1:332){
  p1<-paste(directory,"/",sprintf("%03.f",id[1]),".csv",sep="");
  data<-read.csv(p1);
  for(i in 2:length(id)){
    if(is.na(id[i])){
      break;
    }
    p1<-paste(directory,"/",sprintf("%03.f",id[i]),".csv",sep="");
    
    tdata<-read.csv(p1);
    data<-rbind(data,tdata);
  }
  if(pollutant=="sulfate")
  {tag=2;}
  if(pollutant=="nitrate")
  {tag=3;}
  
  id<-mean(data[,tag], na.rm=TRUE);
  
  return(round(id,3));
  
}

