setwd("c:/r_workdata")

Sys.setlocale("LC_ALL","Korean")

library(lubridate)

# 문제) 다음 식을 날짜 계산이 정상적으로 출력 되게 바꾸시오
# '2022-02-14' - '21.11.06'


as.Date("2022-02-14") - as.Date("21.11.06", "%y.%m.%d")

# R에서는 날짜를 사용할 때 POSIXlt와 POSIXct클래스를 사용
# POSIXlt는 날짜를 년, 월, 일로 표시하는 리스트형 클래스
# POSIXct는 날짜를 연속적인 데이터로 인식하여 1970년을 기준으로 초단위 계산

as.Date("2025-03-19 13:51:00") - as.Date("2025-03-19 15:50:00") 

as.POSIXct("2025-03-19 15:51:00") - as.POSIXct("2025-03-19 13:50:00") 


# 6-2 lubridate 패키지 사용
install.packages("lubridate")

d = now()
d

year(d)
month(d)
day(d)

wday(d, label - T)

d2 = d-day(2)
d2

d+days(100)
d+years(1)

# 문제) 현재 날짜와 시간에 1년 2개월 3일 4시간 5분 6초를 더해라

d = now()

d+days(1)+years(2)+month(3)+hours(4)+minutes(5)+seconds(6)

d2 = hm("22:30")
d2

d3 = hms("22:20:15")
d3


# seq() 순차적 // 1차원 배열 // 벡터터 사용 // c -> 컴바인 

seq(as.Date("2025-01-01"), as.Date("2025-12-31"), 1)
seq(as.Date("2025-01-01"), as.Date("2025-12-31"), 'day')

seq(as.Date("2025-01-01"), as.Date("2025-12-31"), 'month')

seq(as.Date("2025-01-01"), as.Date("2025-12-31"), 'year')

d = seq(as.Date("2025-01-01"), as.Date("2125-12-31"), 'year')
d

d[45]
d[35:45]  # 35 ~ 45까지
d[c(35, 45)]


# 문제) 위에서 작성한 날짜 데이터의 35번쨰 데이터와 45번쨰 데이터의 다음 년도를 출력하시오.


d[c(35, 45)] + years(1)


#변수  // 마지막에 저장한 값을 통해 결과 출력 이전 값은 사라짐짐

v1 = 'aa'
v1
class(v1)

v1 = now()
v1
class(v1)


v1 = Sys.Date()
v1

v1 = c('a','b','c')
v1
v1[1]
v1[2]
class(v1)
str(v1)

v1 <- 2
v1

# 화살표 사용 권장
v2 <- v3 <- v4 <- 1    
v3
v2


v2 = v3 = v4 = 1
v3
v2


10 -> v5 -> v6 -> v7
v5
v6

s1 = "very easy R"
s1

c1 = c(1,2,3)
c1
class(c1)

c1 = c(1,2,3,4,'5') # 문자열로 변경 됨 
c1
class(c1)

# 변수 설정 시 유의 사항
# 1. 대소문자 구분
# 2. 영어, 숫자 모두 사용 가능하지만 첫문자는 반드시 문자(영어)
# 3. 한글 사용 가능
변수 = 1
변수

# 4. 예약어 사용 못한다.
# if, else, ifelse, for, while, break, function, TURE, FALSE, NA, NULL, in, rep ,,,

n1 = 1
n2 = 2
n1 + n2


s1 = 1:5 
s1

s2 'a':'f'  # 문자는 안됨

n3 = '3'
n1+n3
n1+as.numeric(n3)

objects()
objects(all.names = T)
rm(s1)

objects()
rm(list = ls())
objects()

# 데이터처리 객체
# ~ 동일 데이터 타입
# 1. 스칼라 ; 단일 데이터 처리 
# 2. 벡터 : 1차원 배열 (스칼라를 여러개 합친 것)
# 3. matrix : 2차원 배열 (벡터를 여러개 합친 것)
# 4. array : 3차원 배열 (matrix를 여러개 합친 것)

#  ~ 다른 데이터 타입
#  1. list : 벡터와 비슷 (키, 값) 형태
#  2. dataframe : 엑셀의 표나 db의 테이블과 같음(db의 컬럼처럼 라벨이 있음)

#  벡터 : 1차원 배열
#  1. c()함수로 작성
#  2. 인덱스는 1부터 시작
#  3. 하나의 자료형만 사용
#  4. 결측값은 `NA` 사용
#  5. NULL은 어떤 형식도 취하지 않는 특별한 객체

c(1,2,3,4,5)
c(1,2,'3',4,5)

v1 = c(1,2,3,4,5)
v1
v1[1]
v1[0]
v1[-3] # 3번쨰 인덱스 값을 뺴라
v1[3]

length(v1)

# 문제) v1의 첫번쨰 인덱스에서부터 끝에서 세번쨰인덱스까지의 값을 출력하시오. 단 length()를 이용할 것.

v1 = c(1,2,3,4,5)
v1[1:(length(v1)-2)]

v1[-1:-3]

v1[2:4]
v1[2] = 6
v1

v1 = c(v1, 7)
v1

# na가 들어감
v1[9] = 9
v1

# 배열 중간에 값 넣기 (인덱스 3번 뒤 10을 넣음)
append(v1, 10, after = 3)
v1

v1 = append(v1, c(10,11), after = 3)
v1

v1  =append(v1, 12, after = 0)
v1


# 벡터 연산

c(1,2,3) + c(4,5,6)

c(1,2,3) + 1

v1 = c(1,2,3)
v2 = c(3,4,5)
v1 + v2
v3 = c(3,4,'5')
v1+v3

# 중복 값 삭제
union(v1, v3)

v1 = c(1,2,3)
v4 = c(1,2,3,4)
v1 + v4 # 두 백터의 길이가 다를 경우 순환원리가 적용 

v1 - v4

v1 = c(1,2,3)
v2 = c(3,4,5)

setdiff(v1, v2) # v1에는 있지만 v2에는 없는 요소 출력(차집합)
intersect(v1,v2) # v1과 v2에 공통적인 요소 출력(교집합)

# 벡터에 각 컬럼 이름 지정
f = c(10, 20, 30)
f

names(f) = c('apple','banana','peach')
f

# 벡터에 연속적인 데이터 할당 : seq(), rep()

v4 = c(1:5) 
v4

v5 = seq(1:5)
v5

v5 = seq(10: 15)
v5

v5 = seq(1,5)
v5

v6 = seq(-2,2)
v6

c6 = c(-2 : 2)
c6

v7 = seq(1, 10, 2)
v7

v8 = rep(1:3, 2)
v8

v9 = rep(1:3, each=2)
v9

# 벡터의 길이 

v1
length(v1)
NROW(v1)

# 백터의 특정 문자 포함 여부
v7 
3%in%v7
4%in%v7


