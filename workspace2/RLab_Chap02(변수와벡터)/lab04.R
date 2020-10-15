# 벡터의 연산
d <- c(1, 10, 5, 3)
d

# 벡터의 산술연산
2*d  #각 요소에다가 2를 곱해라
d-2
3*d+4

# 벡터와 벡터간의 연산 --> 벡터의 원소의 갯수가 같아야한다.
x <- c(2,4,6)
y <- c(1,3,5)
x+y   # 대응하는 요소끼리 더하여 출력
x*y
x/y
x%%y
z <- x+y
z

# 벡터의 함수 이용
d <- c(1:10)
d
sum(d)
sum(3*d)

# 벡터 요소의 길이(개수)
length(d)

# 벡터 요소의 평균
mean(d[1:5])
max(d)
min(d)

# 정렬(기본적으로 오름차순 정렬)
sort(d)
sort(x = d, decreasing = T)
sort(d, T)

# 중앙값 구하기
v1 <- median(d)
v1
