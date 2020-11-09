# 가로로 합치기
# 데이터 생성
# 중간고사 데이터 생성
test1 <- data.frame(id = c(1,2,3,4,5), midterm = c(60, 80, 70, 90, 85))
test1

# 기말고사 데이터 생성
test2 <- data.frame(id = c(1,2,3,4,5), final = c(70,83,65,95,80))
test2

# id기준으로 합치기
# by에 변수명 지정할때 변수명 앞뒤에 겹따옴표(" ") 입력.
total <- left_join(test1, test2, by = "id")
total

# 반별 담임교사 명단 생성
name <- data.frame(class = c(1,2,3,4,5), teacher = c("kim","lee","park","choi","chu"))
name
exam

exam_new <- left_join(name, exam, by = "class")
exam_new

exam_new2 <- left_join(exam, name, by = "class")
exam_new2

# left_join() : 왼쪽기준 모든 데이터 연결하기
reservation_new <- left_join(reservation_r, order_info_r, by = "reserv_no") %>% arrange(reserv_no, item_id) %>% select(reserv_no, visitor_cnt, cancel, order_no, item_id, sales)
reservation_new

# 세로로 합치기
# 데이터 생성
# 학생 1~5번 시험 데이터 생성
group_a <- data.frame(id = c(1:5), test = c(60,80,70,90,85))
group_a

# 학생 6~10번 시험 데이터 생성
group_b <- data.frame(id = c(6:10), test = c(70,83,65,95,80))
group_b

# 세로로 합치기
# 데이터 합쳐서 group_all에 저장
group_all <- bind_rows(group_a, group_b)
group_all

# 혼자서 해보기
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"), price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22), stringsAsFactors = F)
fuel

# Q1
mpg_fl <- left_join(fuel, mpg, by = "fl")
mpg_fl

# Q2
mpg_fl %>% select(model, fl, price_fl) %>% head(5)
