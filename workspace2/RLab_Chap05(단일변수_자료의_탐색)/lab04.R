# 히스토그램 : 연속형 데이터를 구간별로 나타내주는 그래프

cars
class(cars)
# 자동차의 제동거리만 dist라는 변수에 담기
dist <- cars[,2]
hist(x = dist, breaks = 5,  #구간의 개수
     col = "green",         #막대의 색깔
     border = "blue",       #막대의 테두리 색깔  
     xlab = "제동거리",     #x축 레이블
     ylab = "빈도 수",      #y축 레이블
     ylim = c(0,20), 
     las = 1,               #x축의 글씨 방향 \(0~3) : 0은 가로, 2는 세로
     main = "제동거리"      #제목
     )

# 지진의 강도
quakes
class(quakes)
mag <- quakes$mag
hist(mag, main = "지진발생강도의 분포", xlab = "지진강도", ylab = "발생 건 수", col = rainbow(10))

hist(mag, main = "지진발생강도의 분포", xlab = "지진강도", ylab = "발생 건 수", col = rainbow(10), ylim = c(0, 500), breaks = seq(4, 6.5, by = 0.5))

# 박스 상자 그림     -- boxplots()
cars
View(cars)
dim(cars)
summary(cars)

boxplot(x = dist, main = "자동차 제동거리")
boxplot.stats(x = dist)

head(iris)
View(iris)
summary(iris)
# Petal.Length~Species : Petal.Lengt를 기준으로 하되, Species별로 그려달라.
boxplot(Petal.Length~Species, data = iris, main = "품종별 꽃잎의 길이")

mag <- quakes$mag
head(mag)
boxplot(x = mag, main = "지진 발생 강도의 분포", xlab = "지진", ylab = "발생 건수", col = "red")
boxplot.stats(mag)
min(mag)
max(mag)

mtcars
View(mtcars)
summary(mtcars)

# 화면분할방법 : par()
par(mfrow = c(1,3))
barplot(table(mtcars$carb), main = "카브레터 막대그래프", xlab = "카브레터", ylab = "빈도수", col = "blue")
barplot(table(mtcars$cyl), main = "실린더 막대그래프", xlab = "실린더", ylab = "빈도수", col = "red")
barplot(table(mtcars$gear), main = "기어 막대그래프", xlab = "기어", ylab = "빈도수", col = "green")
