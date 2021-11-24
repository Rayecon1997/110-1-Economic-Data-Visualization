dataset1<-read.csv("/Users/kiwi/Downloads/export_2009.csv")

ggplot(
)+
  geom_line(
    data = dataset1,
    mapping = aes(
      x = DATE,
      y = 出口值到中國大陸,
      color = "出口值到中國大陸（千美元）"
    ),
    size = 1
  )+
  geom_line(
    data = dataset1,
    mapping = aes(
      x = DATE,
      y = 出口值到日本,
      color = "出口值到日本（千美元）"
    ),
    size = 1
  )+
  geom_line(
    data = dataset1,
    mapping = aes(
      x = DATE,
      y = 出口值到美國,
      color = "出口值到美國（千美元）"
    ),
    size = 1
  )+
  geom_line(
    data = dataset1,
    mapping = aes(
      x = DATE,
      y = 出口值到新加坡,
      color = "出口值到新加坡（千美元）"
    ),
    size = 1
  )+
  geom_line(
    data = dataset1,
    mapping = aes(
      x = DATE,
      y = 出口值到大韓民國,
      color = "出口值到大韓民國（千美元）"
    ),
    size = 1
  )+
  geom_line(
    data = dataset1,
    mapping = aes(
      x = DATE,
      y = 出口值到德國,
      color = "出口值到德國（千美元）"
    ),
    size = 1
  )+
  geom_line(
    data = dataset1,
    mapping = aes(
      x = DATE,
      y = 出口值到英國,
      color = "出口值到英國（千美元）"
    ),
    size = 1
  )+
  labs(title="台灣主要貿易國家出口總額"
  )+
  scale_y_continuous("出口額（千美元）", breaks = 10000000*c(1,3,5,7,9,10)
  )+
  scale_x_continuous("年度", breaks = c(2009,2012,2014,2016,2018,2019,2020)
  )+
  geom_vline(
    xintercept = 2019,
    color = "orange",
  )+
  geom_text(
    mapping = aes(
      x=2019,
      y=10000000*11,
      label="Covid-19"  
    ),
    position = position_dodge(0.9),
    size = 4,
  )