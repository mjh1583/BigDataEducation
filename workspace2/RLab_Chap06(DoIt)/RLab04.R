# summarise() 함수 : 행 요약하기
# 열 전체를 입력 값으로 함수를 계산하여 요약값을 출력

# 주문테이블에서 매출(sales)의 평균값을 구하라.
summarise(order_info_r, avg = mean(sales))
summarise(order_info_r, min_value = min(sales), max_value = max(sales))

order_info_r %>% summarise(min_value = min(sales), max_value = max(sales))

exam

# 집단별 요약하기
# math 평균 산출
exam %>% summarise(mean_math = mean(math))

# class별로 분리
exam %>% group_by(class) %>% summarise(mean_math = mean(math))
exam %>% group_by(class) %>% summarise(mean_math = mean(math)) %>% arrange(desc(mean_math))

# 여러 요약통계량 한번에 산출하기
exam %>% 
  group_by(class) %>%                     #class별로 분리
  summarise(mean_math = mean(math),       #math 평균
            sum_math = sum(math),         #math 합계 
            median_math = median(math),   #math 중앙값
            n = n()                       #학생수
            )

# 각 집단별로 다시 집단 나누기 -- 회사별, 구동방식별 분리
mpg
mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>%    #cty 평균산출
  head(10)

# dplyr 조합하기
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (cty + hwy)/2) %>% 
  summarise(total_mean = mean(tot)) %>% 
  arrange(desc(total_mean)) %>% 
  head(5)

# 혼자서 해보기
# Q1
mpg %>% group_by(class) %>% summarise(mean_cty = mean(cty))
# Q2
mpg %>% group_by(class) %>% summarise(mean_cty = mean(cty)) %>% arrange(desc(mean_cty))
# Q3
mpg %>% group_by(manufacturer) %>% summarise(mean_hwy = mean(hwy)) %>% arrange(desc(mean_hwy)) %>% head(3)
# Q4
mpg %>% filter(class == "compact") %>% group_by(manufacturer) %>% summarise(n = n()) %>% arrange(desc(n))

reservation_r
head(reservation_r)
# group_by : 행 그룹화하기
# : summarise() 함수와 함께 사용.
# 예약테이블에서 고객번호(customer_id)로 그룹화하여(group_by) 각 고객별 예약했던 고객수의 평균값(mean)을 구하라.
reservation_r %>% group_by(customer_id) %>% summarise(avg = mean(visitor_cnt))