# apply() -- 행과 열이 있는 2차원 데이터인 매트릭스나 데이터 프레임에 이용함. 
#            반복문에 비해서 속도도 빠르고 사용하기 편리하게 자주 이용함.

iris
dim(iris)

# 1 <-- row(행)방향으로 함수를 적용함.
apply(iris[, 1:4], 1, sum)
apply(iris[, 1:4], 1, mean)

# 2 <-- col(열)방향으로 함수를 적용함.
apply(iris[, 1:4], 2, sum)
apply(iris[, 1:4], 2, mean)

# 사용자 정의 함수에 대해서 알아보기

# mymax함수는 두개의 매개변수를 받아서 큰값을 리턴하는 함수
mymax <- function(x, y){
  if(x > y){
    max <- x
  }else{
    max <- y
  }
  return(max)  
}
mymax(10,5)

a <- mymax(50,20)
b <- mymax(50,200)
print(a+b)

# 함수를 정의함에 있어 매개변수 일부의 값으로 초기값을 설정
mydiv <- function(x, y=2){
  result <- x/y
  return(result)
}
mydiv(10,3)
# 매개변수가 1개 들어가므로 y값은 기본값을 이용
mydiv(10)
mydiv(100)

# 함수는 원래 하나의 기능을 하게끔 구현하는게 맞음.
# R에서는 리턴값으로 벡터나 리스트 형태로 해서 여러개 값을 넘길수 있음.
myfunc <- function(x, y){
  vsum <- x+y
  vmul <- x*y
  return(list(sum = vsum, mul = vmul))
}
result <- myfunc(5, 8)
result
class(result)
result$sum
result$mul

s <- result$sum
m <- result$mul
cat("5 + 8 = ", s, "\n")
cat("5 * 8 = ", m, "\t")

source("mylib.R")
c <- myadd(10,55)
cat("10 + 55 = ", c)

source("mylib.R")
c <- myminus(10,55)
cat("10 - 55 = ", c)

