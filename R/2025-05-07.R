setwd("c:/r_workdata")

Sys.setlocale("LC_ALL", "Korean")

library(lubridate)
library(dplyr)
library(ggplot2)
library(googleVis)

library(plyr)


# 그래픽 기초
# plot() : 분포도나 꺽은선
# plot(y축데이터, 옵션)
# plot(x축데이터, 옵션)
# plot(x축, y축, 옵션)

v1 = c(2, 2, 2)
plot(v1)

# x축, y축
x = 1:3
y = 3:1

plot(x, y)

# x축, y축의 한계값 지정
plot(x, y, xlim = c(1, 10), ylim = c(1, 5))


# 축 제목 : xlab, ylab, main : 그래프 제목
plot(x,y, xlim = c(1,10), ylim = c(1, 5), xlab = "x축값", ylab = "y축값", main = "PLOT TEST")

plot.new() # 창을 지우고 다시 그린다
dev.new() # 새로운 창에서 다시 그린다   -> 하고 다시 plot를 해야 반영

v1 = c(100, 130, 120, 160, 150)

# axes -> 축 삭제   //   ann -> 축 이름도 삭제
plot(v1, type = 'o', col='red', ylim = c(0, 200), axes = F, ann= F)

# 1 -> x축   // 2 -> y축
axis(1, at= 1:5, lab = c('MON','TUE','WED','THU','FRI'))
axis(2, llim= c(.200))
title(main = 'FRUITS', col.main = 'red', font.main = 4)
title(xlab = 'DAY', col.lab = 'black')
title(ylab = 'PRICE', col.lab = 'blue')

# 그래프의 배치조정 : mfrow
# par(mfrow = c(nr, nc))     # row의 개수, col의 개수

par(mfrow = c(3,3))
plot(v1, type = 'b')    # 점과 선
plot(v1, type = 's')    # 원쪽 시작 계단형
plot(v1, type = 'S')    # 오른쪽 시작 계단단형
plot(v1, type = 'l')    # 선
plot(v1, type = 'p')    # 점
plot(v1, type = 'c')    # 'b'에서 점 생략
plot(v1, type = 'o')    # 점과 선이 중첩
plot(v1, type = 'h')    # 각 지점에서 x축까지 수직선
plot(v1, type = 'n')    # 축만 표현

par(mfrow = c(1,3))
pie(v1)                 # 둥근
plot(v1, type = 'o')
barplot(v1)             # 막대 그래프


par(mfrow = c(1,1))
a = c(1,2,3)
plot(a, xlab='aaa')

# 그래프의 여백 조정
# mgp = c(제목위치, 지표값 위치, 지표선 위치)
par(mgp = c(2,1,0))
plot(a, xlab='aaa')

# oma(outsize margine) : 그래프의 전체 여백 조정, oma(bottom, left, top, right)

par(oma = c(2,2,2,2))
plot(a, xlab= 'aaaa')

# 여러개의 그래프를 중첩으로 그리기
# par(new = T), add = T
v1 = c(1,2,3,4,5)
v2 = c(5,4,3,2,1)
v3 = c(3,4,5,6,7)

plot(v1, type = 's', col='red', ylim = c(1,5))
par(new = T)
plot(v2, type = 'o', col='blue', ylim = c(1,5))
par(new = T)
plot(v3, type = 'l', col='green')


plot(v1, type = 's', col='red', ylim = c(1, 10))
lines(v2, type = 'o', col='blue', ylim = c(1,5))
lines(v3, type = 'l', col='green', ylim = c(1, 100))

# 범례추가
# legend(x추그 y축, 내용, cex = 글자크기, col = 색상, pch = 크기, lty = 선모양)
legend(4,9,c('v1','v2','v3'), cex = 0.9, col =  'red','blue','green', lty = 1) 
#lty  =  0 ~ 6

# barplot() : 막대그래프
x = c(1,2,3,4,5)
barplot(x)

# 가로막대그래프
barplot(x, horiz = T)

# 그룹으로 묶어서 출력 : besize = T
x = matrix(c(5,4,3,2), 2)
x
barplot(x, beside = T, names = c(5,3), col=c('green','yellow'))

# 그룹으로 묶어서 출력
barplot(x, beside = T, names = c(5,3), col=c('green','yellow'), horiz = T)


# 하나의 막대로 가로 출력
barplot(x, names = c(5,3), col=c('green','yellow'), horiz = T, xlim = c(0,12))


# 여러 막대를 그룹으로 묶어서 한번에 출력
v1 = c(100,120,140,160,180)
v2 = c(120,13,150,140,170)
v3 = c(140,170,120,110,160)

qty = data.frame(BANANA = v1, CHERRY = v2, ORANGE = v3)
qty

# barplot을 그룹으로 묶어서 출력할때는 반드시 출력대상이 matrix여야 한다.
class(qty)
barplot(as.matrix(qty), main='FRUITS SALES', beside = T, col= rainbow(nrow(qty)), ylim = c(0,400))
legend(14,400, c('MON','TUE','WED','THU','FRI'), cex = 0.8, fill = rainbow(nrow(qty)))

# 전치 행렬 (행과 열이 바뀜)
t(qty)

barplot(t(qty), main = 'FRUITS SALES', col = rainbow(length(qty)), ylim = c(0, 400), names.arg = c('MON','TUE','WED','THU','FRI'), cex.axis = 0.8, las = 2, cex = 0.8, beside = T)
legend(0.8, 300, names(qty), cex = 0.8, fill = rainbow(length(qty)))

# 조건을 주고 그래프 그리기
# peach값이 200이상 red, 180 ~ 199 yellow, 그 이하 green
peach = c(180, 200, 250, 198, 170)

colors = c()
for (i in 1:length(peach)) {
  if(peach[i] >= 200){
    colors = c(colors, 'red')
  } else if (peach[i] >= 180){
    colors = c(colors, 'yellow')
  } else {
    colors = c(colors, 'green')
  }
}

barplot(peach, main='PEACH SALES', names.arg = c('MON','TUE','WED','THU','FRI'), col = colors)

# 매개변수가 있는 함수 처리
f1 = function(f){
  colors = NULL
  for (i in 1:length(f)) {
    if(f[i] >= 200) {
      colors[i] = 'blue'
    } else if (f[i] >= 180){
      colors[i] = 'pink'
    } else {
      colors[i] = 'green'
    }
  }
  return(colors)
}

f1(peach)
barplot(peach, col = f1(peach), names.arg = c('MON','TUE','WED','THU','FRI'))



# 실습
x1 = c(100, 130, 190, 160, 150, 220)
# 1. 힌 화면에 6개의 그래프를 나타내어라
par(mfrow= c(2,3))

# 2. 점과 선의 조합으로 이루어진 그래프 출력력
plot(x1, type = 'o', col='red', ylim = c(0, 250))

# 3. 가로출력
barplot(x1, horiz = T)
# 4. 그룹으로 묵어서 출력
v4 = matrix(x1,2,3)
barplot(v4, beside = T, names.arg = c(1,2,3), col = c('green', 'yellow'))

# 5. 그룹으로 묶어서 가로 출력
barplot(v4, beside = T, names.arg = c(1,2,3), col = c('green', 'yellow'),horiz = T)
# 6. 하나의 막대그래프로 가로로 출력
barplot(v4, names.arg = c(1,2,3), col=c('green','yellow'), horiz = T, xlim = c(0,500))
# 7. 하나의 막대그래프로 세로로 출력
barplot(v4, names.arg = c(1,2,3), col=c('green','yellow'), ylim = c(0,500))

# 8. 조건을 주고 그래프 그리기 : 한 화면에 하나의 그래프로 표현
#     v1 값이 200이상 red, 180 ~ 199 yellow, 그 이하 grean
par(mfrow = c(1,1))
x1
colors = c()
for (i in 1:length(x1)) {
  if(x1[i] >= 200){
    colors = c(colors, 'red')
  } else if (x1[i] >= 180){
    colors = c(colors, 'yellow')
  } else {
    colors = c(colors, 'green')
  }
}

barplot(x1, main= 'TEST SALES', names.arg = c('MON','TUE','WED','THU','FRI', 'SAT'), col = colors)























