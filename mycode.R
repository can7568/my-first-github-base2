head(iris)
print(1)
# Git bash에서 수정 커밋하고 푸쉬
#....

anscombe
str(anscombe)

df <- anscombe
par(mfrow=c(2,2))

plot(df$x1,df$y1,pch=19,col='tomato')
#직선을 그리려면
abline(lm(y1~x1,data=df),col="blue")


plot(df$x2,df$y2,pch=19,col='tomato')
abline(lm(y2~x2,data=df),col="blue")


plot(df$x3,df$y3,pch=19,col='tomato')
abline(lm(y3~x3,data=df),col="blue")


plot(df$x4,df$y4,pch=19,col='tomato')
abline(lm(y4~x4,data=df),col="blue")
par(mfrow=c(1,1))

install.packages("tidyverse")
library(tidyverse)

str(mpg)
?mpg
#배경화면 설정과 같음
p <- ggplot(data=mpg, mapping=aes(x=displ,y=hwy))
p

p + geom_point()
p+geom_point(mapping = aes(color=class))

head(colors())
#사이즈를 class별로 줘라
p + geom_point(mapping = aes(color = class,size = class))
#class에 따라서 shape을 줘라
p + geom_point(mapping = aes(color = class,shape=class))
#겹친 것 보이게 하기
p + geom_point(mapping = aes(color = class,size = class,alpha=0.3))
#color 하나 일 때? 컬러만 줄 때?, 매핑말고 그냥 color로 줘야 인식함.
p + geom_point(mapping=aes(color = "blue"))
p + geom_point(color = "blue")
#문장이 안 끝났으면 +가 뒤에 있어야 함
#종류별로 그려줌 , nrow는 탭(행) 개수 설정
p + geom_point(color = "coral") + facet_wrap(~ class,nrow=2)
#그리드 형태로 만들기 / wrap은 size에 맞춤. grid는 drv??값에 따라서
table(mpg$drv)
p + geom_point(color = "pink3") + facet_grid(drv ~ cyl)
par(mfrow = c(1,1))
table(mpg$cyl)
barplot(table(mpg$cyl),col = "skyblue")

#추세선 + 회색으로 표시된 부분은 오차
p + geom_point(color = "slateblue") + geom_smooth(color = 'hotpink')

colors()

#매핑으로 하면 class별로 각각 색을 부여함
p + geom_point(mapping = aes(color = class))+geom_smooth(color = 'hotpink')

library(ggplot2)
data("diamonds")
str(diamonds)

#ggplot에서는 geom을 주로 씀(stat 잘 안 씀)
p <- ggplot(data= diamonds)

p + geom_bar(mapping=aes(x=cut),fill= "steelblue")
#위와 결과 같음(근데 잘 안 씀)
p + stat_count(mapping=aes(x=cut),fill= "steelblue")
#clarity로 나눠서 표시
p + geom_bar(mapping = aes(x=cut,fill= clarity))
#끝까지 채워서(fill = 누적막대그래프)
p + geom_bar(mapping = aes(x=cut,fill= clarity),position = "fill")
#dodge는 세로로 세워서 확인
p + geom_bar(mapping = aes(x=cut,fill= clarity),position = "dodge")
#jitter 원래 자기 위치에서 약간 비틀어서 표현(산점도)
#mapping은 생략 가능
ggplot(data = mpg)+geom_point(aes(x= displ,y=hwy,color=class))
ggplot(data = mpg)+geom_point(aes(x= displ,y=hwy,color=class,size=class),position="jitter")
#데이터 다시 mpg로 변환
p <-  ggplot(data=mpg,mapping = aes(x=class,y=hwy))
p+geom_boxplot(fill = "lightyellow")
#x축과 y축을 변환하고 싶을 때는 coord_flip()사용
p+geom_boxplot(fill = "lightyellow") + coord_flip()
#다이아몬드 버전으로 박스플롯 그리기 ~~~~
p <- ggplot(data= diamonds,aes(x=cut,y=carat))
p + geom_boxplot(fill="pink")
p + geom_boxplot(fill="pink") + coord_flip()

#polar 좌표 만들기 data =생략 가능 
p <-  ggplot(diamonds,aes(x=cut,fill=cut))
#polar는 동글하기 때문에 legend도 생략함
p + geom_bar(show.legend = F, width=1)
#x와 y 축 이름도 없앰
p+ geom_bar(show.legend = F,width=1)+ coord_polar()
p+ geom_bar(show.legend = F,width=1)+ labs(x=NULL,y=NULL)+ coord_polar()

p+ geom_bar(show.legend = F,width=1)+ labs(x=NULL,y=NULL)+theme(aspect.ratio = 1) +coord_polar()

world <- map_data("world")
ggplot(world,aes(long,lat,group = group))+geom_polygon(fill='lightpink3',color='gray')

nz <-  map_data("nz")
ggplot(nz,aes(long,lat,group = group))+geom_polygon(fill='orange',color='tomato')

p <- ggplot(mpg,aes(displ,hwy))+geom_point(aes(color=class))+geom_smooth(se=F)

p + labs(title = "Fuel Efficiency .vs. Engine Size", 
         subtitle = "서브 타이틀", caption = "설명",
         x = "엔진크기", y = "연비",color = "유형별 색상")


#OOP = Object
str(iris)
#print(sd(mean(sum(sort(iris)))))
#불변 객체 = immutable
#가변 객체 = mutable
#계속 바뀌는 속성 ex) 나이 -> 그냥 바꾸면 됨. 객체지향적. 가변객체 선호
#반대로 함수지향적으로 봤을 때는 x = 10이라고 하고 f(x) = x + 5일때,
#f(x)는 15가 됨. 어떤 수가 들어갔을 때 무조건 5를 더한 값을 반환해야함.
#근데 만약 x = 10, y = 20, f(x) = x + 5 + y 일 때, y의 값에 따라 반환 값이 달라질 수 있음.
# => 부작용: side-effect 그래서 이런 부작용이 발생하지 않도록 하기 위해 순수 함수를 사용한다.(함수형 프로그래밍의 특징)

df <- mpg[,c(2,3,9,11)]
#%>% 파이프 라인 연산자는 그 결과를 보내준다고 생각하면 됨
df.trim <- df%>% group_by(class) %>% filter(row_number(desc(hwy))==1)
df.trim

p <- ggplot(mpg,aes(displ,hwy)) + geom_point(aes(color = class)) + geom_smooth(se=F)
p + geom_text(data = df.trim,aes(label = model))
#nudge 사용하면 글자가 잘 보이게 그릴 수 있음(label 함수 사용해야함.)
p + geom_label(data = df.trim,aes(label = model),nudge_y = 5,alpha=0.5)
#Inf 는 무한대. x축과 y축을 무시하겠다는 것
label <- tibble(displ = Inf, hwy = Inf,label="동해물과 백두산이")
p + geom_text(data = label,aes(label = label),vjust = "top",hjust = "right")

install.packages("networkD3")
library(networkD3)
library(dplyr)
str(gapminder)
install.packages("gapminder")
library(gapminder)
ggplot(data= gapminder,mapping = aes(x=gdpPercap,y=lifeExp,color =continent))+geom_point(alpha=0.5)+scale_x_log10()

ggplot(data= gapminder,mapping = aes(x=gdpPercap,y=lifeExp,color =continent))+geom_point(alpha=0.5)+scale_x_log10(labels=scales::dollar)+
    labs(title="GapMinder: GDP .vs. Life Expectancy", x = "GDP per captia",y="Life Expectancy")+
    theme(plot.title=element_text(size=24,face="bold",color="tomato"))

#점의 크기를 인구수(pop)에 대비시켜서 그리기.
ggplot(data= gapminder,mapping = aes(x=gdpPercap,y=lifeExp,color =continent,size=pop))+geom_point(alpha=0.5)+scale_x_log10(labels=scales::dollar)+
    labs(title="GapMinder: GDP .vs. Life Expectancy", x = "GDP per captia",y="Life Expectancy")+
    theme(plot.title=element_text(size=24,face="bold",color="tomato"))
