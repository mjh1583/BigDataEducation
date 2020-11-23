# 데이터 분석(EDA) 준비하기 
# 1. 패키지 준비 -- foreign 패키지 설치
install.packages("foreign")

# 2. 패키지 로드
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

# 3. 데이터 불러오기
# - 복지패널데이터 로드
raw_welfare <- read.spss("data_spss_Koweps2014.sav", to.data.frame = T)

# 4. 데이터 copy
welfare <- raw_welfare

# 5. 데이터 검토하기
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

# 6. 변수명 변경하기
welfare <- rename(welfare, 
                  sex = h0901_4,            #성별
                  birth = h0901_5,          #태어난 연도
                  income = h09_din)        #가처분소득

# 7. 변수 확인
class(welfare$sex)
summary(welfare$sex)
table(welfare$sex)

class(welfare$birth)
summary(welfare$birth)
table(welfare$birth)

class(welfare$income)
summary(welfare$income)
table(welfare$income)
