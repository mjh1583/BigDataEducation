# 데이터 불러오기
exam <- read.csv("csv_exam.csv")
exam

# 결측치 생성하기
# 3, 8, 15 행의 math에 NA 할당
exam[c(3, 8, 15), "math"] <- NA
exam

# 평균 구하기
library(dplyr)

exam %>% summarise(mean_math = mean(math))

# 결측치 제외하고 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = T))

# 다른 함수들에 적용
exam %>% summarise(mean_math = mean(math, na.rm = T), 
                   sum_math = sum(math, na.rm = T),         #합계산출 
                   median_math = median(math, na.rm = T))   #중앙값산출

# ----------------------------------------------------------------------------------------
# 결측치 대체하기(평균값)
# 평균구하기
# 결측치 제외하고 math 평균 산출
mean(exam$math, na.rm = T)    # 55

# 평균으로 대체하기
# math가 NA이면 55로 대체
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
exam

# 결측치 빈도표 생성
table(is.na(exam$math))

mean(exam$math)    #math 평균 산출

# 혼자서 해보기
library(ggplot2)
mpg <- as.data.frame(ggplot2 :: mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA
mpg

# Q1 두 변수에 결측치가 있는지 확인
table(is.na(mpg$hwy))
table(is.na(mpg$drv))

# Q2
mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy)) %>% arrange(desc(mean_hwy))
                                                                                              