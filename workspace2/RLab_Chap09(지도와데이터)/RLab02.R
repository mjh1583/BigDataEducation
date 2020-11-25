# 2.설악산 근방의 지도 보기
# 지점의 경도 위도
gc <- geocode(enc2utf8("설악산"))
gc

# 경도, 위도를 숫자로
cen <- as.numeric(gc)
cen

# 지도 생성
map <- get_googlemap(center = cen,          #중심점 좌표 
                     zoom = 15,              #지도 확대 정도
                     size = c(640, 640),    #지도 크기
                     maptype = "hybrid")   #지도 유형 (roadmap, hybrid, terrian)

# 지도 화면에 보이기
ggmap(map)

# 3. 경도와 위도 값을 입력하여 지도 보기

cen <- c(128.3932127, 36.141002)
map <- get_googlemap(center = cen, 
                     zoom = 15,              #지도 확대 정도
                     size = c(640, 640),    #지도 크기
                     maptype = "hybrid")
ggmap(map)

# 36.141002,128.3932127