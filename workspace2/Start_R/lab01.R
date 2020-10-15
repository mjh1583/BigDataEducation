# 패키지 설치
install.packages("dplyr")
install.packages("ggplot2")

# 패키지 로드
library(dplyr)
library(ggplot2)

# 데이터 검토 (세로 : 변수, 가로 : 데이터)
head(mpg)
dim(mpg) #몇행 몇열인지 보여줌
str(mpg) #변수 속성
summary(mpg) #데이터 요약
View(mpg) #원래 데이터 보여줌

# alt + '-' = <-
