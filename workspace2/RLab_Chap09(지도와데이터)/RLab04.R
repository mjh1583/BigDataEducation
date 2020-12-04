# 4. 지도 위에 데이터 표시

# 데이터 준비
library(ggplot2)
library(ggmap)
register_google(key = )

head(wind)
dim(wind)

sp <- sample(1:nrow(wind), 50)    #50개 데이터 샘플링
sp

df <- wind[sp, ]  #50개의 행을 가지는 데이터 프레임
df

cen <- c(mean(df$lon), mean(df$lat))  #지도의 중심점 계산
cen

gc <- data.frame(lon = df$lon, lat = df$lat)  #측정 위치 좌표값 데이터(데이터를 표식할 곳)
head(gc)

# 측정 위치에 마커 표시하기
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 6,
                     markers = gc)

gmap <- ggmap(map)
gmap

# 풍속을 원의 크기로 표식하기

# 마커없는 지도 가져오기
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 6)

# 지도를 저장
gmap <- ggmap(map)
gmap

# 풍속을 원의 크기로 표시
gmap + geom_point(data = df,
                  aes(x = lon, y = lat, size = spd),
                  alpha = 0.5,      #투명도
                  col = "blue") +
  scale_size_continuous(range = c(1,14))  #원의 크기 조절

# 도로교통공단 시도 시군구별 월별 교통사고 (2018)
ds.tot <- read.csv("도로교통공단_시도_시군구별_월별_교통사고(2018).csv")

ds.seoul <- subset(ds.tot, 시도 == "서울")
ds.seoul

# aggregate() : 그룹별로 통계 적용하기
# 기준열로 그룹화하여 특정열에 대한 요약 통계(max, min, mean, median, sum... 등)를 적용한 값 반환하는 함수
# aggregate(data, by = "기준이 되는 컬럼", FUN)

ds.year <- aggregate(ds.seoul[, "발생건수"], by = list(시군구 = ds.seoul$시군구), FUN = sum)

ds.year

gc <- geocode(enc2utf8(as.vector(ds.year$시군구)))
gc

cen <- colMeans(as.matrix(gc))
cen

map <- get_googlemap(center = cen,
                     size = c(640, 640),
                     zoom = 11,
                     maptype = "roadmap")

ggmap(map)

gmap <- ggmap(map)

gmap + 
  geom_point(data = data.frame(gc),
             aes(x = lon, y = lat, size = ds.year$x),
             alpha = 0.5,
             col = "red") + 
  scale_size_continuous(range = c(1, 14))




