setwd("c:/r_workdata")
getwd()

Sys.setlocale("LC_ALL", "Korean")

library(lubridate)
library(dplyr)
library(ggplot2)
library(googleVis)

library(plyr)

install.packages("multilinguer")
library(multilinguer)

install.packages(c('string', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'))

# remotes 페키지에 있는 install_github를 사용하기 위해 추가
install.packages("remotes")
remotes::install_github("haven-jeon/KoNLP", upgrade = 'never', INSTALL_opts = c("--no-multiarch"), force = TRUE)
library(KoNLP)
useSejongDic()

install.packages("wordcloud")
install.packages("RColorBrewer")
library(wordcloud)
library(RColorBrewer)



# setwd("Cloud/project")

# 1. 데이터에서 단어만 추출
d1 = readLines("BTS유엔연설_국문.txt")
d1

d2 = sapply(d1, extractNoun, USE.NAMES = F)
d2

# 2. 단어 집합 생성
d3 = unlist(d2)

# 3. 단어 필터링
d4 = filter(function(x){
  nchar(x) <= 7
}, d3)

# 4. 단어 핸들링

# 5. txt파일로 저장하고 table로 읽어들이면서 공백제거
write(unlist(d3), "BTS_kor.txt")
d4 = read.table("BTS_kor.txt")
d4

# 6. 단어빈도수 저장
wc = table(d4)

d3 = filter(function(x){
  nchar(x) >= 2
}, d3)



# 7. wordcloud로 출력
pal = brewer.pal(9, "Set3")
wordcloud(names(wc), freq = wc, scale = c(5, 1), rot.per = 0.25, min.freq = 2, random.color = T, random.order = F, colors = pal)



library(KoNLP)
useSejongDic()

install.packages("stringr")
install.packages("wordcloud")
install.packages("RColorBrewer")
library(stringr)
library(wordcloud)
library(RColorBrewer)

# 워드클라우드
# 1. 데이터에서 단어만 추출
# 2. 단어 집합 생성
#3. 단어 필터링
# 4. 단어 핸들링
#5. txt

buildDictionary(user_dic = data.frame(readLines("제주도여행지.txt"), "ncn"))

t1 = readLines("jeju.txt")
t1

p1 = sapply(t1, extractNoun, USE.NAMES = F)
p1
c1 = unlist(p1)

p1 = str_replace_all(c1, "[^[:alpha:]]","")
p1

p1 = gsub(" ", "", p1)
t1 = readLines("제주도여행코스gsub.txt")
t1

for (i in 1:length(t1)) {
  p1 = gsub((t1[i]),"", p1)
}
p1  

p1 = Filter(function(x){
  nchar(x) >= 2
}, p1)

write(unlist(p1), "jeju_2.txt")

p2 = read.table("jeju_2.txt")

wc = table(p2)
wc

pal = brewer.pal(9, "Set3")
wordcloud(names(wc), freq = wc, scale = c(5, 1), rot.per = 0.25, min.freq = 2,random.order = T, random.color = F, colors = pal)


top10 = head(sort(wc, decreasing = T), 10)
top10

install.packages("wordcloud2")
library(wordcloud2)

wordcloud2(top10, color = "random-light")

library(plotrix)
pct = round(top10/sum(top10)*100,1)
lab=paste(names(top10), '\n', pct, '%')

pie3D(top10, main = "제주도여행코스 top10", col=rainbow(10), labelcex = 1, labelcol = 'blue', labels = lab, explode = 0.2)

bp = barplot(top10, main = "제주도여행코스 top10", col=rainbow(10), cex.names = 0.7, las = 1, ylim = c(0, 25))

