library(dplyr)
library(ggplot2)
# 테이블 조작
# bind_cols() 함수 : 테이블 열 붙이기
# order_info_r과 똑같은 temp_order_info_r테이블 만들어서 두 테이블을 붙여보자

order_info_r
temp_order_info_r <- order_info_r
temp_order_info_r

bind_order_info_r <- bind_cols(order_info_r, temp_order_info_r)
bind_order_info_r

# bind_rows() : 테이블 행 붙이기
bind_rows(order_info_r, temp_order_info_r)

# 조인 함수 : inner_join(), left_join(), right_join(), full_join()
# join : 테이블의 데이터를 연결하는 매개체가 되는 키(key)로 서로 연결하는 기법

# 이너 조인 : 조인 조건이 정확히 일치하는 경우 겨로가 출력(동등 조인)
# inner_join() : 일치하는 데이터 연결하기
# reservation_r(예약정보) 테이블과 order_info_r(주문정보) 테이블 연결해보자. 예약번호(reserv_no)열을 키로 연결해보자.
# => reserv_no가 일치하는 행들만 출력된 것을 확인
View(order_info_r)
View(reservation_r)

data_inner_join <- inner_join(reservation_r, order_info_r, by = "reserv_no") %>% 
  arrange(reserv_no, item_id) %>% 
  select(reserv_no, customer_id, item_id, sales)
data_inner_join

# left_join() : 왼쪽 기준 모든 데이터 연결하기
left_join(reservation_r, order_info_r)

# right_join() : 오른쪽 기준 모든 데이터 연결하기, 원리는 left_join()과 같음/
# 연결하는 기준 테이블이 오른쪽(right)이라는 점만 다름
reservation_new <- right_join(reservation_r, order_info_r, by = "reserv_no") %>% arrange(reserv_no, item_id) %>% select(reserv_no, visitor_cnt, cancel, order_no, item_id, sales)
reservation_new

# full_join() 함수 : 양쪽 모든 데이터 연결하기
# add_row() 함수 사용하여 order_info_r 테이블에 임의의 reserv_no 생성해서 풀조인

# 새로운 행 생성
table_added_row <- order_info_r %>% 
  add_row(order_no = "1", item_id = "1", reserv_no = "1", sales = 1)

data_full_join <- full_join(reservation_r, table_added_row, by = "reserv_no") %>%
  arrange(reserv_no, item_id) %>% select(reserv_no, customer_id, visitor_cnt, order_no, item_id, sales)
View(data_full_join)

# intersect() 함수 : 데이터 교집합 구하기

# reservation_r의 reserv_no 추출
reservation_r_rsv_no <- select(reservation_r, reserv_no)

# order_info_rd의 reserv_no 추출
order_info_r_rsv_no <- select(order_info_r, reserv_no)

# 양쪽 데이터셋에 존재하는 reserv_no
intersect(reservation_r_rsv_no, order_info_r_rsv_no)

# setdiff() 함수 : 데이터 빼기, 차집합
setdiff(reservation_r_rsv_no, order_info_r_rsv_no)

# union() 함수 : 중복을 제거해서 데이터 합치기, 합집합
union(reservation_r_rsv_no, order_info_r_rsv_no)

# reservation_r 테이블에서 평균 방문 고객 수(visitor_cnt)가 세명 이상인 고객을 구하되, 평균 방문 고객 수가 높은 고객부터 출력하시오.
visit <- reservation_r %>% #테이블 선택해서 데이터를 전달
  group_by(customer_id) %>% #고객번호로 그룹화
  summarise(mean_cnt = mean(visitor_cnt)) %>% 
  filter(mean_cnt >= 3) %>% #요약된 값이 3이상인 행만 선택
  arrange(desc(mean_cnt))

View(visit)

visit <- reservation_r %>% #테이블 선택해서 데이터를 전달
  group_by(customer_id) %>% #고객번호로 그룹화
  mutate(mean_cnt = mean(visitor_cnt)) %>%  #방문 고객수의 평균을 mean_cnt라는 열로 생성
  select(customer_id, mean_cnt) %>%  #고객번호와 평균열 선택
  filter(mean_cnt >= 3) %>% #요약된 값이 3이상인 행만 선택
  distinct(customer_id, mean_cnt) %>%  #고객번호와 평균열의 유일값만 추출
  arrange(desc(mean_cnt))
View(visit)

# order_info_r 테이블의 메뉴(item_id)별, 월별 평균 매출을 계산한 후 메뉴별, 월별로 오름차순 정렬해서 출력하시오(메뉴 아이템별 월 평균 매출) 
# subset() : 조건식으로 데이터를 추출
# subset(x, 조건식, 열)
# substr() : 데이터에서 일부 문자열을 선택해사 추출
# substr(데이터(열이름), 시작위치, 종료위치)
data_avg_sales <- order_info_r %>% 
  group_by(item_id, month = substr(reserv_no, 1, 6)) %>%
  summarise(avg_sales = mean(sales)) %>% 
  arrange(item_id, month)
View(data_avg_sales)

data_avg_sales <- order_info_r %>% 
  mutate(month = substr(reserv_no, 1, 6)) %>% 
  group_by(item_id, month) %>%
  summarise(avg_sales = mean(sales)) %>% 
  arrange(item_id, month)
View(data_avg_sales)








