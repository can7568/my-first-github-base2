library(ggplot2)
library(gapminder)
drive <- read.csv("2020년 일자별 음주운전.csv", header=T)
str(drive)
#point 버전
ggplot(data= drive,mapping = aes(x=사고월,y=합계,color = 사고월,size=합계))+
    geom_point(alpha=0.5)+
    labs(title="[2020년 월별 음주운전 사고수 그래프]", x = "사고월",y="합계")+
    theme(plot.title=element_text(size=24,face="bold",color="blue"))
#bar 버전
ggplot(drive,aes(x=사고월,y=합계,fill = 사고월))+
    geom_bar(stat="identity") + labs(title="< 2020년 월별 음주운전 사고수 그래프 >", x = "사고월",y="합계")+
    theme(plot.title=element_text(size=24,face="bold",color="tomato"))
#일별로 보기
a <- drive %>%
    select(ends_with('일')) %>% head()
b <- a[1,]
str(b)
ggplot(a[1,],aes(x=a[1,],y=사고월))+
    geom_bar(stat="identity") + labs(title="< 2020년 월별 음주운전 그래프 >", x = "사고월",y="합계")+
    theme(plot.title=element_text(size=24,face="bold",color="tomato"))

# pdf() 함수로 저장 경로 파일과 연결
# width와 height로 크기 지정
pdf.options(family = "Korea1deb")
pdf("데이터시각화과제_변지영2.pdf", width = 12, height = 10)

ggplot(data= drive,mapping = aes(x=사고월,y=합계,color = 사고월,size=합계))+
    geom_point(alpha=0.5)+
    labs(title="[2020년 월별 음주운전 사고수 그래프]", x = "사고월",y="합계")+
    theme(plot.title=element_text(size=24,face="bold",color="blue"))
#bar 버전
ggplot(drive,aes(x=사고월,y=합계,fill = 사고월))+
    geom_bar(stat="identity") + labs(title="< 2020년 월별 음주운전 사고수 그래프 >", x = "사고월",y="합계")+
    theme(plot.title=element_text(size=24,face="bold",color="tomato"))
#일별로 보기

        

# dev.off() 함수로 R과 연결된 파일 연결 종료
dev.off()
