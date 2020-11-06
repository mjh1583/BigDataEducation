# mutate() 함수 : 열 조작해서 새로운 열 생성하기

# 총합 변수 추가
exam %>% mutate(total = math + english + science) %>% head

# 총합 변수, 총 평균 변수 추가
exam %>% mutate(total = math + english + science, mean = total / 3) %>% head

# mutate()에 ifelse() 적용하기
exam %>% mutate(grade = ifelse(science >= 60, "pass", "fail")) %>% head

order_info_r
# mutate()함수를 사용해서 reserv_no(예약번호)별로 평균 매출 확인하기
order_info_r %>% group_by(reserv_no) %>% mutate(avg = mean(sales)) 

# transmute() 함수 : 원래 열 빼고 새로운 열 생성하기
# 기능은 mutate()함수와 동일, 기존 테이블의 열을 반환하지 않음
order_info_r %>% group_by(reserv_no) %>% transmute(avg = mean(sales)) 

# mutate_all() 함수 : 모든 열 조작해서 새로운 열 생성하기
# funs() : 사용할 함수를 지정 
# 각 열의 최대값을 찾아 출력
order_info_r %>% mutate_all(funs(max))

# mutate_if() 함수 : 특정 조건 열만 조작해서 새로운 열 생성하기
# 열이 숫자형일 경우 로그(log)로 바꿔라
order_info_r %>% mutate_if(is.numeric, funs(log(.)))

# mutate_at() 함수 : 특정한 열만 조작해서 새로운 열 생성하기
# mutate_all()함수는 모든 열에 대해 조작하는 함수
# mutate_at()함수는 지정한 열만 조작함
# vars() : select()와 유사한 함수. 열을 선택하는 함수

# 지정할 열에 대해 최대값을 구하는 max함수 적용하기
order_info_r %>% mutate_at(vars(sales), funs(max))

# 혼자서 해보기
# Q1
mpg_new <- as.data.frame(ggplot2 :: mpg)
mpg_new <- mpg_new %>% mutate(total = hwy + cty)
head(mpg_new)
# Q2
mpg_new <- mpg_new %>% mutate(avg = total / 2)
head(mpg_new)
# Q3
mpg_new %>% arrange(desc(avg)) %>% head(3)
# Q4
mpg %>% mutate(total = hwy + cty) %>% mutate(avg = total / 2) %>% arrange(desc(avg)) %>% head(3)
