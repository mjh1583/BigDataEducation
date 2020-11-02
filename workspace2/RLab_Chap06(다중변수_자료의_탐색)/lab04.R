# 패키지 설치
install.packages("dplyr")
install.packages("ggplot2")

# 패키지 로드
library(dplyr)
library(ggplot2)

# 데이터 검토
head(mpg)

# 데이터 분석
# 1.회사별 평균 연비 높은 순 정렬

mpg %>% group_by(manufacturer) %>% 
        summarise(mean.hwy=mean(hwy)) %>% 
        arrange(desc(mean.hwy))

# 2. 포드 연비 높은 순 정렬
mpg %>% 
  filter(manufacturer == 'ford') %>% group_by(model) %>% arrange(desc(hwy))
View(mpg %>% filter(manufacturer == 'ford') %>% group_by(model) %>% arrange(desc(hwy)))

# 3. 배기량과 연비 관계 그래프
qplot(data = mpg, x = displ, y = hwy)

mean(mpg$hwy)
max(mpg$hwy)
min(mpg$hwy)
hist(mpg$hwy)

e2 <- c("Hello!", "world", "is", "good")
# 문자처리함수
paste(e2, collapse = " ")  # 빈칸 두분자로 문자 붙이기
paste(e2, collapse = ",")  # 빈칸 두분자로 문자 붙이기

# 함수 파라미터 지정하기
# 'x = ' : x축
qplot(data = mpg, x = hwy)
qplot(data = mpg, x = cty)

# 'geom = ' : 그래프 형식
qplot(data = mpg, y = hwy, x = drv, geom = "point")
qplot(data = mpg, y = hwy, x = drv, geom = "boxplot")

# 'colour = ' : 색깔구분
qplot(data = mpg, y = hwy, x = drv, geom = "boxplot", colour = drv)

# 함수 사용법이 궁금할때 help
help(qplot)
?qplot

# 엑셀 데이터 불러오기
# readxl 패키지 설치 
install.packages("readxl")
# readxl 패키지 로드
library(readxl)

# 엑셀 파일 불러오기
df_finalexam <- read_excel("finalexam.xlsx", sheet = 1, col_names = T)
View(df_finalexam)