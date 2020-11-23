# 정제 - 이상치 확인 및 결측처리
# 성별 이상치 : 모름/무응답 => 9

# 이상치 확인
table(welfare$sex)

# 이상치 결측 처리
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)

# 결측치 존재 여부 확인
table(is.na(welfare$sex))

# 변수값 변경 -- 항목 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")

table(welfare$sex)  

qplot(welfare$sex)
