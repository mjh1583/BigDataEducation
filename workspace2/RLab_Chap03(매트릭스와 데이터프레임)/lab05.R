# 데이터프레임 알아보기

city <- c("Seoul", "Tokyo", "Washington")  #문자형 벡터
#class()라는 함수 : 매개변수로 들어간 변수에 담긴 데이터의 자료구조를 알려주는 함수
class(city)

a <- c(1:10)   #정수형 벡터
class(a)

b <- seq(0.0, 1.0, 0.1)   #실수형 벡터
b
class(b)

# str() : 데이터의 요약정보를 알려줌
str(a)
str(b)
str(city)
str(rank)

rank <- c(1:3)

# city라는 문자형 벡터와 rank라는 정수형 벡터가 합쳐서 데이터프레임 형태가 된다.
city.info <- data.frame(city, rank)
city.info

# 데이터프레임도 2차원 데이터 타입이므로 얼마든지 인덱스로 접근가능하고 수정도 가능하다.
city.info[1,1]
class(city.info)

iris
View(iris)

# dim() : 행과 열의 개수를 표시하는 함수 
dim(iris)

# nrow() : 행의 개수를 출력
nrow(iris)

# ncol() : 열의 개수를 출력
ncol(iris)

# colnames() : 열의 이름을 출력
colnames(iris)

# rownames() : 행의 이름을 출력
rownames(iris)

# head() : 데이터 셋의 앞,뒷부분 일부 출력 
head(iris, 10)
tail(iris, 9)

# 데이터 셋의 요약정보 출력
str(iris)

# 데이터 셋의 자료구조 출력
class(iris)

iris[,5]

# 품종은 팩터이다.
class(iris[,5])
levels(iris[,5])

# 빈도수 확인
table(iris[,"Species"])

# subset() : 조건에 맞는 값을 추출한다.
setosa <- subset(x = iris, Species == "setosa")
setosa
class(setosa)

v1 <- subset(x = iris, (Sepal.Length > 5.0) & (Sepal.Width > 4.0))
v1
class(v1)

# 테스트 문제
# 1번
25+99
456-123
2*(3+4)
(3+5*6)/7
(7-4)*3
210+35
1256%%7
184%%5
1976/24
16*25+186*5-67*22

# 2번
a <- 5
b <- 4
c <- a+b
c

# 3번
pi <- 3.14
10^2*pi
12^2*pi
15^2*pi

# 4번
y <- 2*x^2+5*x+10
x <- c(6, 8, 10)
y

# 5번
val.a <- 10
sum.ab <- val.a+val.b  #정의되지 않은 변수 b가 사용되었으므로 연산전에 변수 b를 선언해야 한다.
