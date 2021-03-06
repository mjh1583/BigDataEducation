# 상관 분석에 대해서 이해하기
# 음주량
beers <- c(5,2,9,8,3,7,3,5,3,5)
# 혈중 알콜 농도
bal <- c(0.1, 0.03, 0.19, 0.12, 0.04, 0.0095, 0.07, 0.06, 0.02, 0.05)

length(beers)
length(bal)

data <- data.frame(beers, bal)
data

# 산점도 그리기
plot(bal~beers, data = data)

# lm() : 회귀식을 수하는 함수
res <- lm(bal~beers, data = data)
res
# abline() : 회귀선을 그리는 함수
abline(res)

# cor() : 상관계수를 구하는 함수
# -1 <= r <= 1 
# -0.5보다 작거나 혹은 0.5이상, 1에 가까울수록 상관도가 높다.
cor(beers, bal)

# iris데이터 셋 4개의 변수의 상관관계
cor(iris[, 1:4])

mtcars
# 연비를 가져옴
mpg <- mtcars$mpg
# 배기량을 가져옴
disp <- mtcars$disp
# 중량을 가져옴
wt <- mtcars$wt

# 산점도 그리기
plot(x = mpg, y = disp)
plot(x = mpg, y = wt)
plot(x = disp, y = wt)

# 연비와 배기량의 상관계수 : -1에 가깝다
cor(mpg, disp)
# 연비와 중량의 상관계수 : -1에 가깝다
cor(mpg, wt)
cor(disp, wt)

str(mtcars)
# 여닙외 카브레터의 상관관계 : -0.5509251
carb <- mtcars$carb
plot(x = mpg, y = carb)
cor(mpg, carb)