# arrange() 함수 : 행 정렬하기
# sales 값을 오름차순으로 정렬

# sales값을 오름차순으로 정렬
order_info_r %>% arrange(sales)

# 내림차순으로 정렬 : desc옵션 추가함
order_info_r %>% arrange(desc(sales))

# reserv_no 순서대로 오름차순 정렬 후 다시 item_id로 오름차순 정렬
order_info_r %>% arrange(reserv_no, item_id)

# 오름차순으로 정렬하기
exam %>% arrange(math)

# 내림차순으로 정렬하기
exam %>% arrange(desc(math))

# 정렬 기준 변수 여러개 지정
# class 및 math 오름차순 정렬하기
exam %>% arrange(class, math)

# 혼자서 해보기
mpg <- as.data.frame(ggplot2 :: mpg)
head(mpg)
audi <- mpg %>% filter(manufacturer == "audi") %>% arrange(desc(hwy))
head(audi, 5)