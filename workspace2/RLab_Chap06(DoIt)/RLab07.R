library(ggplot2)
library(dplyr)
midwest
View(midwest)
str(midwest)

# 혼자해보기
# Q1 미성년 인구 : (변수추가), 전체인구 : poptotal, 성인인구 : popadults

# midwest 불러오기
midwest <- as.data.frame(ggplot2 :: midwest)
midwest

# midwest에 백분율 추가
midwest <- midwest %>% 
  mutate(ratio_child = ((poptotal - popadults) / poptotal) * 100)
head(midwest, 10)

# Q2
midwest %>% arrange(desc(ratio_child)) %>% select(county, ratio_child) %>% head(5)

# Q3
midwest <- midwest %>% mutate(grade = ifelse(ratio_child >= 40, "large", ifelse(ratio_child >= 30, "middle", "small" )))
midwest %>% count(grade)
table(midwest$grade)

# Q4
midwest <- midwest %>% mutate(ratio_asian = popasian/poptotal * 100)
midwest %>% arrange(ratio_asian) %>% select(state, county, ratio_asian) %>% head(10)
