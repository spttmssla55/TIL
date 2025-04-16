setwd("c:/r_workdata")

Sys.setlocale("LC_ALL", "Korean")

library(lubridate)
library(dplyr)
library(ggplot2)
library(googleVis)

library(plyr)

# dqlyr() : plyr()와 동시에 사용한다면 plyr 패키지의 함수가 우선 적용
# 특성함수
# 1. filter : 조건을 줘서 필터링
# 2. select : 특정 컬럼만 선택
# 3. arrange : 정렬
# 4. mutate : 새로운 변수 생성
# 5. summarise(with group_by) : 주어진 데이터를 접계(min, max, mean, count)
library(dplyr)

d1 = read.csv("야구성적.csv")
d1
View(d1)


# filter
# 경기수가 120경기 이상인 선수
d2 = filter(d1, 경기 >= 120)
d2

# 경기수가 120경기 이상이면서 득점도 80점 이상인 선수
d3 = filter(d1, 경기 >= 120 & 득점 >= 80)
d3

# 포지션이 1루수 이거나 3루수인 선수
d4 = filter(d1, 포지션 == '1루수' | 포지션 == '3루수')
d4

d4 = filter(d1, 포지션 %in% c('1루수', '3루수'))
d4

# select : 특정 컬럼을 찾아줌
# 선수명, 포지션, 팀 데이터만 조회
select(d1, 선수명, 포지션, 팀)

# 순위 ~ 타수까지 조회
select(d1, 순위:타수)

#특정 컬럼럼 제외
select(d1, -홈런, -타점, -도루)

# %>% : 여러 문장을 조합해서 사용

# 선수명, 팀, 경기, 타수를 조회를 하되 타수가 400 이상인 선수
d1 %>%
  filter(타수 >= 400) %>%
  select(선수명, 팀, 경기, 타수)


d1 %>%
  select(선수명, 팀, 경기, 타수) %>%
  filter(타수 >= 400)

# arrange
            # 오름차순
d1 %>%
  filter(타수 >= 400) %>%
  select(선수명, 팀, 경기, 타수) %>%
  arrange(타수)

            # 내림차순
d1 %>%
  filter(타수 >= 400) %>%
  select(선수명, 팀, 경기, 타수) %>%
  arrange(desc(타수))


# mutate : select로 불러온 컴럼들을 이용해 새로운 변수를 만들 수 있음
d1 %>% 
  select(선수명, 팀, 경기, 타수) %>%
  mutate(경기X타수 = 경기*타수) %>% 
  arrange(desc(경기X타수))
  
              # 오류 : 득점은 select로 안가져왔으므로 오류
d1 %>% 
  select(선수명, 팀, 경기, 타수) %>%
  mutate(경기X득점 = 경기*득점) %>% 
  arrange(desc(경기X득점))


# 안타율 컬럼 생성 : 안타 / 타수 구해서 할푼리로 출력
d1 %>% 
  select(선수명, 팀, 경기, 안타, 타수) %>% 
  mutate(안타율 = round(안타 / 타수, 3)) %>% 
  arrange(desc(안타율))


# summarise(with group_by)
# 팀별로 평균 경기 횟수

                  # 충돌
d1 %>% 
  group_by(팀) %>% 
  summarise(avg = mean(경기, na.rm=T))



d1 %>% 
  group_by(팀) %>% 
  dplyr::summarise(avg = mean(경기, na.rm=T))


                  # across
d1 %>% 
  group_by(팀) %>% 
  dplyr::summarise(across(경기, ~mean(.,na.rm=T)))


# 여러컬럼을 대상으로 집계
# 팀별로 경기와 타수의 평균
                  
                  # 오류
d1 %>% 
  group_by(팀) %>% 
  summarise_each(funs(mean), 경가, 타수)
    

                  # across
d1 %>% 
  group_by(팀) %>% 
  dplyr::summarise(across(c(경기, 타수), mean))






# 여기서 5문제   
# 벡터 작성
# 연산자 활용
# 벡터 활용 함수
# matrix 활용 함수
# list 활용 함수
# 데이터프레임
# subset함수

# ~시험 문제 50%~
# 백터 문제에서는 날짜 활용 문제
# matrix 활용 문제는 수업시간에 matrix관련 문제 풀었던거 
# 데이터 프레임에서 이거는 반만 알려줄꺼야 데이터 프레임을 만드는 2가지 방법 나는 개인적으로 이렇게 만든다하면서 만든거 그리면서 뒤에 처리 하는 내용



