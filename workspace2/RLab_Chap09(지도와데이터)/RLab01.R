version
install.packages("ggplot2")
install.packages("ggmap")
install.packages("devtools")
install.packages("dplyr")
install_github("dkahle/ggmap", force = T)

library(devtools)
library(ggplot2)
library(ggmap)
library(dplyr)

# 구글키 등록
register_google(key = "AIzaSyDdfoNg3z3_dp1TVM8jv9TFqOaq57eBN9c")

# 1.서울시 종로구 근방의 지도 보기
# 지점의 경도 위도
gc <- geocode(enc2utf8("종로구"))
gc

# 경도, 위도를 숫자로
cen <- as.numeric(gc)
cen

# 지도 생성
map <- get_googlemap(center = cen, 
                     zoom = 15,
                     maptype = "hybrid")

# 지도 화면에 보이기
ggmap(map)