datavis<-"/Users/kiwi/Data vis./data vis class/"
Bachelor<-read.csv(paste0(datavis,"/week13/GCT1502US_Bachelor.csv"))
Advanced<-read.csv(paste0(datavis,"/week13/GCT1503US_Advanced.csv"))

Under<-Advanced
identi<-Under[,2]*0+100
Under<-cbind(Under[,1],identi)
Under[,2]<-as.numeric(Under[,2])-as.numeric(Bachelor[,2])-as.numeric(Advanced[,2])
Catego<-c("Under","Under","Under","Under","Under","Under","Under")
Under<-cbind(Under[,1],Catego,Under[,2])

Catego<-c("Bachelor","Bachelor","Bachelor","Bachelor","Bachelor","Bachelor","Bachelor")
Bachelor<-cbind(Bachelor[,1],Catego,Bachelor[,2])

Catego<-c("Advanced","Advanced","Advanced","Advanced","Advanced","Advanced","Advanced")
Advanced<-cbind(Advanced[,1],Catego,Advanced[,2])

Edu<-rbind(Under,Bachelor,Advanced)
colnames(Edu)<-c("DATE","Catego","Proportion")
Edu<-as.data.frame(Edu)
Edu[,1]<-substring(Edu$DATE,1,4)
Edu[,1]<-as.numeric(Edu[,1])
Edu[,3]<-as.numeric(Edu[,3])

ggplot()+
  geom_area(
    data = Edu,
    mapping = aes(
      x = DATE,
      y = Proportion,
      fill = Catego
    ),
    color = "white",
    position = "stack",
  )+scale_fill_brewer(name = "學歷", labels=c("碩士以上","大學畢業","大學以下"),type ="qual",palette="Greens",direction = -1#input$palette
  )+scale_x_continuous(name = "year")+theme(legend.position = "top",
  )+labs(title="歷年美國學歷變動", caption = "Sorce: FRED"
  )