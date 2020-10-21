# 변수 : 데이터 저장 공간
# 데이터형 : 숫자형, 문자형, 범주형, 논리형, 특수상수 등
# 연산자 : 산술, 비교, 논리 연산자
# 벡터 : 단일값들의 모임
# 배열 : 열과 행을 가지는 데이터 집합. 벡터의 요소들을 다시 벡터로 구성된 형태.
# 데이터 프레임 : 서로 다른 데이터형이 표 형태로 정리된 구조.
# 출석부, 성적관리부, 회원관리부 등이 데이터를 관리하기 편한 표 형태로 구성되어 있음.

x <- 1
y <- 2
x
y
temp <- x
x <- y
y <- temp
x
y

# R의 기본 데이터형
# 1.숫자형 => int(integer) : 정수, num(numeric) : 실수, cplx(complex) : 복소수
# 2.문자형 => chr(character) : 작은따옴표나 큰따옴표로 묶어 표기
# 3.범주형 => factor : 레벨에 따라 분류된 형태
# 4.논리형 => TRUE(T), FALSE(F)
# 5.특수 상수 => NULL : 정의되지 않은 값, NA(Not Available) : 결측값, -Inf(음의 무한대), Inf(양의 무한대),
#                NAN(Not a Number) : 0/0, Inf/Inf 등과 같이 연산 불가능한 값 표시

blood.type <- factor(c('A', 'B', 'O', 'AB'))
blood.type
T
F
xinf <- Inf
yinf <- -Inf
xinf/yinf

# 데이터형 확인 함수
# class(x) : x의 데이터형 확인
# is.integer(x) : x가 정수형이면 T, 아니면 F
# is.numeric(x) : x가 실수형이면 T, 아니면 F
is.complex(x)
is.na(x)

# 데이터형 변환 함수
# as.factor(x) : x를 범주형으로 변환
as.integer(X)
as.numeric(x)
as.character(x)
as.matrix(x)
as.array(x)

x <- 1         #x에 단순히 1을 넣은 경우 x는 숫자형.
class(x)
is.integer(x)
x <- 1L        #x에 1L을 입력한 경우 x는 정수형.
class(x)
is.integer(x)

# 산술연산자
# 지수승 : ^ 또는 **
5^2
# x를 y로 나눈 나머지 : x %% y
5%%2
# x를 y로 나눈 몫 : x %/% y
5%/%2
# x를 y로 나누기 : x / y
5/2

# 연산자 우선순위(높은순위 높은것)
# ^, **
# +, -     (단항 연산자)
# %%, %/%
# *, /
# +, -     (덧셈, 뺄셈)
# ==, !=, <, >, <=, >= (비교연산자)
# ! (논리부정)
# &, && (논리곱 AND)
# |, || (논리합 OR)

# 벡터
# vector 함수이용 : 요소 개수가 n개인 빈 벡터 생성
vector(length = 5)
# c 함수 이용 : 일반 벡터 생성
c(1:5)
c(1,2,3, c(4:6))

y <- c()  #y를 빈벡터로 생성
y
y <- c(y, c(1:3))
y

# seq 함수 이용 : 순열 벡터 생성
seq(from = 1, to = 10, by = 2)
seq(1, 10, 2)
seq(0, 1, length.out = 11)

# rep 함수 이용 : 반복 벡터 생성
rep(c(1:3), times = 2)
rep(c(1:3), each = 2)

# head, tail 함수
x <- 1:10
x
head(x)
tail(x)
head(x,3)
tail(x,3)

# 벡터 간 집합 연산
x <- c(1,2,3)
y <- c(3,4,5)
z <- c(3,1,2)

# 합집합
union(x,y)
# 교집합
intersect(x,y)
# 차집합 (x에서  y와 동일한 요소 제외)
setdiff(x,y)
setdiff(y,x)

setequal(x,y)
setequal(x,z)

# 배열
x <- array(1:5, c(2,4))
x

x[1,]
x[,2]

# matrix 함수 : 2차원 배열 생성
x <- 1:12
x
matrix(x, nrow = 3)
matrix(x, nrow = 3, byrow = T)

# cbind, rbind 함수 : 열,행 단위로 묶어 배열 생성
v1 <- c(1,2,3,4)
v2 <- c(5,6,7,8)
v3 <- c(9,10,11,12)

cbind(v1,v2,v3)  #열단위 묶어 배열 생성
rbind(v1,v2,v3)  #행단위 묶어 배열 생성

# 데이터프레임 : 가장 흔히 쓰이는 표 형태의 데이터 구조를 가짐
# 행렬과 달리 여러 데이터형을 혼합하여 저장할 수 있음
name <- c('철희', '춘향', '길동')
age <- c(22, 20, 25)
gender <- factor(c('M', 'F', "M"))
blood.type <- factor(c('A','O','B'))

patients <- data.frame(name, age, gender, blood.type)
patients

patients$name
patients[1,]
patients[,2]
patients[3,1]

# 데이터의 요약
summary(patients)