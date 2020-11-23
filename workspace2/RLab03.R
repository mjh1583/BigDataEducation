# 정제 - 이상치 확인 및 결측처리 - 소득
# 변수 검토 및 수정
class(welfare$income)
summary(welfare$income)

qplot(welfare$income) + xlim(0, 10000)

# 결측치 존재 여부 확인
table(is.na(welfare$income))

# 성별ㅡ 소득 평균 분석
# 성별 소득 평균표 생성
sex_income <- welfare %>% group_by(sex) %>% summarise(mean_income = mean(income))
sex_income

# 그래프 생성
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()