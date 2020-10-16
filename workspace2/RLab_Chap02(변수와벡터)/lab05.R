install.packages("ggplot2")   #ggplot2 패키지 설치
library(ggplot2)              #ggplot2 패키지 로드

x <- c("a", "a", "b", "c") 
x

# 빈도 그래프 출력
qplot(x)

# ggplot2의 mpg 데이터로 그래프 만들기
qplot(data = mpg, x = hwy)
qplot(data = mpg, x = cty)
qplot(data = mpg, x = drv, y = hwy)
qplot(data = mpg, x = drv, y = hwy, geom = "line")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv )
?qplot

student_score <- c(80, 60, 70, 50, 90)
student_score
mean(student_score)
student_mean <- mean(student_score)
student_mean

