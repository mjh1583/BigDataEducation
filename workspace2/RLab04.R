# 9장 프로젝트를 통해 실전 분석 
# 분석1 : 성별에 따른 소득
# 분석2 : 나이와 소득의 관계
# 분석3 : 연령대에 따른 소득
# 분석4 : 연령대 및 성별에 따른 소득


# ============================================================================================================================
# 분석2 : 나이와 소득의 관계

# 절차
# 1) 변수 검토 및 정제 - 나이
# 1-1) 태어난 연도 변수 검토
# 1-2) 정제 - 이상치 확인 및 결측 처리
# 1-3) 나이 변수 생성

# 2) 변수 검토 및 정제 - 소득
# 3) 나이별 소득 평균 분석
# -나이별 소득 평균표 생성
# -그래프 생성
# =======================================================================

# 1-1) 태어난 연도 변수 검토
library(foreign)
library(dplyr)
library(ggplot2)

# 복지패널 데이터 로드
raw_welfare <- read.spss("data_spss_Koweps2014.sav", to.data.frame = T)

# 데이터 copy
welfare <- raw_welfare
View(welfare)

# 데이터 검토
dim(welfare)
str(welfare)
head(welfare)
summary(welfare)

# 변수명 변경해주기
welfare <- rename(welfare, 
                  sex = h0901_4,            #성별
                  birth = h0901_5,          #태어난 연도
                  income = h09_din)        #가처분소득

class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

