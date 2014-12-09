corr<-function(directory, threshold=0){
  completecase<-complete(directory);
  id=1:332;
  p1<-paste(directory,"/",sprintf("%03.f",id[1]),".csv",sep="");
  data<-read.csv(p1);
  res<-1:332;
  res<-NaN
  

  for(i in 1:length(id)){
    if(is.na(id[i])){
      break;
    }
    if(completecase[i,2]>threshold){
      p1<-paste(directory,"/",sprintf("%03.f",id[i]),".csv",sep="");
      data<-read.csv(p1);
      data<-data[!(is.na(data[,2]) | is.na(data[,3])),]
      res[i]<-cor(data[,2],data[,3]);    
    }
  }
  res1<-res[!(is.nan(res)|is.na(res))];


  return(round(res1,5));
}



