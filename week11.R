trade<-read.csv("/Users/kiwi/Downloads/Taiwan_Trade_2020.csv")
trade<-trade[,1:3]
t1=20#input$t1
t2=300000

label_amount<-scales::label_dollar(
  scale = 0.01,accuracy = 1,prefix = "NTD",suffix = "億"
)

ggplot()+
  geom_col(
    data = trade,
    mapping = aes(
      x = Country,
      y = Amont,
      group = factor(Categ.,levels = c("進口值","出口值")),
      fill = factor(Categ.,levels = c("出口值","進口值")),
    ),
    position = "dodge",
    color = "white"
  )+
  geom_text(
    data = trade,
    mapping = aes(
      x = Country,
      y = Amont+10*t1,
      label = label_amount(Amont),
      group = factor(Categ.,levels = c("進口值","出口值"))
    ),
    colour="#013A4F",
    hjust = 0.75,
    size = 5,
    position = position_dodge(width = 0.9)#input$width
  )+scale_fill_brewer(name = "貿易類別", labels=c("Export","Import"),type ="qual",palette="Greens",direction = -1#input$palette
  )+scale_x_discrete(""
  )+scale_y_continuous("",position = "right",breaks = c(2*t2,5*t2,10*t2),labels = c("6000億","1.5兆","3兆"))+theme(legend.position = "top", panel.grid.major.x = element_line(size=0.5,colour="#B3D9D9")
  )+labs(title="臺灣2020年對外貿易額", caption = "Sorce: AREMOS 經濟統計資料庫檢索系統"
  )+coord_flip()