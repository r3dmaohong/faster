library(ggplot2)
ggplot(airquality,aes(Wind,Temp)) + geom_point()
##alpha���z����
ggplot(airquality,aes(Wind,Temp)) + geom_point(color="steelblue",alpha="0.4",size=5)
ggplot(airquality,aes(Wind,Temp)) + geom_point(aes(color=factor(Month)),alpha="0.4",size=5)

ggplot(airquality,aes(Wind,Temp)) + geom_point() + geom_smooth()
ggplot(airquality,aes(Wind,Temp)) + geom_point() + stat_smooth()
ggplot(airquality,aes(Wind,Temp)) + stat_smooth()
##���w��k �����۫H�϶�
##aes���ǳB�m
ggplot(airquality,aes(Wind,Temp)) + stat_smooth(method="lm",se=F)
ggplot(airquality,aes(Wind,Temp)) + stat_smooth(method="lm",se=F,aes(col=factor(Month)))
ggplot(airquality,aes(Wind,Temp,col=factor(Month))) + stat_smooth(method="lm",se=F)
##�C�⤣�P�]�h�I���F
ggplot(airquality,aes(Wind,Temp,col=factor(Month),group=1)) + stat_smooth(method="lm",se=F)
ggplot(airquality,aes(Wind,Temp,col=factor(Month),group=1)) + geom_point() +stat_smooth(method="lm",se=F)
ggplot(airquality,aes(Wind,Temp,col=factor(Month))) + geom_point() +stat_smooth(method="lm",se=F,aes(group=1))

ggplot(airquality,aes(Wind,Temp,col=factor(Month))) + geom_point() +stat_smooth(method="lm",se=F,aes(group=1))+stat_smooth(method="lm",se=F)

#ggplot(airquality,aes(Wind,Temp)) + geom_bar(stat = "identity")

##install.packages('RColorBrewer')
##�n�ݽզ�O
library('RColorBrewer')
##5�Ӥ���ҥH5���C�� �M��b�[�W����@���C��
myColors <- c(brewer.pal(5,"Dark2"),"black")
display.brewer.pal(5,"Dark2")

ggplot(airquality,aes(Wind,Temp,col=factor(Month))) + 
  geom_point() +
  stat_smooth(method="lm",se=F,aes(group=1,col="All")) + 
  scale_color_manual("Month", values = myColors)

##�e���P���O
ggplot(airquality,aes(Wind,Temp,col=factor(Month))) + 
  geom_point() +
  stat_smooth(method="lm",se=F) + 
  scale_color_manual("Month", values = myColors) +
  facet_grid(.~Month) ##�̷Ӥ����
##���ܥD�D
ggplot(airquality,aes(Wind,Temp,col=factor(Month))) + 
  geom_point() +
  stat_smooth(method="lm",se=F) + 
  scale_color_manual("Month", values = myColors) +
  facet_grid(.~Month)  + 
  theme_classic()
##?theme
ggplot(airquality,aes(Wind,Temp,col=factor(Month))) + 
  geom_point() +
  stat_smooth(method="lm",se=F) + 
  scale_color_manual("Month", values = myColors) +
  facet_grid(.~Month)  + 
  theme_classic()

##
pal <- colorRamp(c("red","blue"))
pal(0)#red
pal(1)#blue
pal(0.5) #��������X?
pal(seq(0,1,len=10))

##16�i���X
pal <- colorRampPalette(c("red","yellow"))
pal(1)
pal(2) #���� ����
pal(10) #�Ĥ@�Ӭ����� �̫�@�Ӭ����� ������������
brewer.pal.info
##3���C��
cols <- brewer.pal(3,"Greens")
pal <- colorRampPalette(cols)
##�b�T�Ӻ��I�����ȥX20��
image(volcano,col=pal(20))
##�d���C��
display.brewer.pal(3,"Greens")
display.brewer.pal(12,"Set3")

##����pdf�� �e�϶i�h
pdf(file="miyfig.pdf")
with(airquality,plot(Wind,Temp,main="Wind and Temp in NYC"))
dev.off()
ggplot(airquality,aes(Wind,Temp,col=factor(Month))) + 
  geom_point() +
  stat_smooth(method="lm",se=F) + 
  scale_color_manual("Month", values = myColors) +
  facet_grid(.~Month)  + 
  theme_classic()
dev.copy(png,file="mycopy.png")
dev.off()