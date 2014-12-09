complete<-function(directory,id=1:332){
  p1<-paste(directory,"/",sprintf("%03.f",id[1]),".csv",sep="");
  data<-read.csv(p1);
  list1<-merge(id[1],sum(!(is.na(data[,2])|is.na(data[,3]))));
  for(i in 2:length(id)){
    if(is.na(id[i])){
      break;
    }
    p1<-paste(directory,"/",sprintf("%03.f",id[i]),".csv",sep="");
    
    tdata<-read.csv(p1);
    list1<-rbind(list1,merge(id[i],sum(!(is.na(tdata[,2])|is.na(tdata[,3])))));
  }
  names(list1)<-c("id","nobs")
  return(list1);
  
}