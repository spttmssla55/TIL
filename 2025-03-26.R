setwd("c:/r_workdata")

Sys.setlocale("LC_ALL","Korean")

library(lubridate)

# seq() 합수를 사용하여 date4라는 변수에 2015년 1월 1일부터 2015부터 1월 31일까지 1일씩 증가하는 21개의 날짜를 입력하는 방법을 쓰세요

seq(as.Date("2015-01-01"), as.Date("2015-01-31"), 1)

# vec1 생성 후 3번째 요소인 '감'을 제외하고 vec1 의 값을 출력력

vec1 <- c('사과', '배', '감', '버섯', '고구마')
vec1

vec1[-3]


# vec1 과 vec2를 만드세요

vec1 <- c('봄', '여름', '가을', '겨울') 
vec2 <- c('봄', '여름', '늦여름', '초가을')
union(vec1, vec2)       # 합
setdiff(vec1, vec2)     # 교
intersect(vec1, vec2)   # 차

#1. a~f값을 갖는 백터 생성
c1 <- c('a', 'b', 'c', 'd', 'e', 'f')

#  1-1) 3,5번쨰 데이터를 대문자로 변경
c1[c(3,5)] <- c('C','E')
c1[c(2,4)] <- toupper(c1[c(2,4)])

#  1-2) 4번쨰 데이터 삭제
c1 <- c1[-4]
c1

#  1-3) 위의 벡터를 factor 타입으로 변경
c1 <- as.factor(c1)
class(c1)

#2. 2022년 전체 날짜를 갖는 v1 벡터 생성
v1 = seq(as.Date("2022-01-01"), as.Date("2022-12-31"), 1)

# 2-1) 위의 벡터를 년도를 제외한 월.일 형식으로만 출력하여 v2 생성
v2 = format(c1, "%m%d")
v2
class(v2)
# 2-2) 2022년 2월 28일의 위치 확인 (names 함수 활용) 
d1 = v1
names(d1) = 1:length(d1)
d1

# 2-3) v1에서 2022년 2월 28일 뒤에 2월 29일 날짜 삽입
d1[59]
d2 = append(as.character(d1), "2022-02-29", after=59)
d2
d3 = as.Date(d2)
d3                      # 2022년은 윤년X 29 >> NA 로 표시


# matrix && 동일한 데이터 값을 처리
# 1. 벡터를 여러개 합친 형태 : 행렬
# 2. 모든 컬럼과 행은 동일한 타입
# 3. 기본적으로 열로 생성
# 4. 다른 데이터타입의 데이터를 저장할 경우 데이터 프레임을 사용한다.

m1 = matrix(c(1,2,3,4))      # (4열 1행)여루선 법칙
m1

m2 = matrix(c(1,2,3,4), nrow = 2)      # 함수 앞 n이 있으면 n = 갯수
m2

m3 = matrix(c(1,2,3,4), nrow = 2, byrow = T) 
m3

m3 = matrix(c(1,2,3,4), nrow = 2, by = T) 
m3
m3[1,1]
m3[2,1] 
m3[,1]         # 모든 행의 1열을 가져옴
m3[1,]         # 모든 열의 1행을 가져옴

m4 = matrix(c(1,2,3,
              4,5,6,
              7,8,9), 3, by = T)
m4

# 새로운 행과 열 추가 : rbind(), cbind()

m4 = rbind(m4, c(11,12,13))
m4

m4 = rbind(m4, c(15,16,17,18))    # 오류// 현재 열 3개 < 추가 열 4개
m4                                # 18 데이터 삭제


m4 = cbind(m4, c(20,21,22))       # 순환시킴 비어있는 데이터 추가 됨 20 부터 다시 순환 
m4 

# 이름 지정
# 행

rownames(m4) = c(1,2,3,4,5)        
m4

# 열

colnames(m4) = c('1st','2nd','3rd','4th')
m4


# matrix 사용

m1 = matrix(1:20, 4, by = T)
m1

# 앞 -> 행, 뒤 -> 열
dimnames(m1) = list(c(1,2,3,4), c('a','b','c','d','e'))
m1


#색인

m1[2,3]
m1[-3,]    # 3번쨰 행을 제외한 나머지 출력

# 행렬 조건

m1 >= 10


# 10 이상인 원소 출력

m1[m1>=10]

# m1의 c가 10 이상인 행 출력

m1[, 'c'] >= 10            # 틀린 예

m1[m1[,'c']>= 10,]         # 정답



# m1의 e값이 20인 행의 3~5번째의 컬럼 출력
m1
m1[m1[,'e'] == 20, 3:5]

# matrix 문제
no = c(1,2,3,4)
name = c('apple','banana','peach','berry')
price = c(500, 200, 200, 50)
qty = c(5,2,4,7)

m1 = cbind(no, name, price, qty)
m1

# 1. peach 가격 
m1[m1[,'name'] == 'peach', 'price']

# 1-2 apple과 peach의 데이터만 출력
m1[m1[,'name'] == 'peach' | m1[,'name'] == 'apple', 'price']

# 1-3 sales라는 컬럼 생성 (단, sales = price * qty)
sales = c(price * qty)
m1 = cbind(m1, sales)
m1

# 1-4 첫번쨰 컬럼 제거 후 각 행번호 설정
rownames(m1) = m1[,1]
m1 = m1[,-1]

# 1-5 qty가 5이상인 과일 이름 출력
m1[m1[, 'qty'] >= '5', 'name']       # matrix에서 비교연산으로 원소 추출 시 1차원 백터로 리턴(행렬구조를 잃어버린다)

# 1-6 5번째 과일 추가 (mango, 100원, 10개)

v1 = c('mango', 100, 10, sales)
m1 = rbind(m1, v1)
m1

rownames(m1)[5] = 5
m1

# array : 3차원 배열 ( 행, 렬, 높이)
#matrix를 쌓아 놓은 형태

a1 = array(c(1:12), dim = c(4,3))
a1


a2 = array(c(1:12), dim = c(2,2,3))      # 열, 행, 층
a2
a2[1,1,3]






