# 서울 세종문화예술회관 중심의 지도 출력
# 패키지 로딩
library(ggmap)
library(ggplot2)

# 구글 지도 API키 설정
register_google(key = "AIzaSyDdfoNg3z3_dp1TVM8jv9TFqOaq57eBN9c")

# 37.5722161,126.9736984

# 경도와 위도를 중심으로 지도 정보 생성
map <- get_googlemap(center = c(126.9736984, 37.5722161),
                     maptype = "roadmap",
                     zoom = 17,
                     size = c(320, 320))

# 지도 출력
ggmap(map)

# 지도 여백 설정(여백이 없는 상태)
ggmap(map, extent = "device")

#----------------------------------------------------------------------------------------------------------------
# 주소 이용 지도 출력

# 지역명에 대한 경도, 위도 생성
# 한글 지역명 : utf-8형식으로 변환
gc <- geocode(enc2utf8("호미곶"))
gc

# 지도 중심위치로 사용할 벡터 생성
lonlat <- c(gc$lon, gc$lat)
lonlat

map <- get_googlemap(center = lonlat)
ggmap(map)

# 마커 출력

map <- get_googlemap(center = lonlat,
                     marker = gc)
ggmap(map)

#----------------------------------------------------------------------------------------------------------------
# 단양팔경을 지도 위에 표시 => 관광안내 지도
# 지명 : 도담삼봉, 석문, 구담봉, 육순봉, 사인암, 하선암, 중선암, 상선암

# 1. 구글 지도 API정보 설정
# 2. 단양팔경 지역명/ 주소 설정
# 3. 단양팔경 위도/경도 검색 : geocode()
# 4. 지도 중심좌표 설정
# 5. 구글 지도정보 생성 : get_googlemap()
# 6. 지도 출력 : ggmap()
# 7. 지역명 출력 : geom_text()

# 패키지 설치 및 로딩
library(ggmap)
library(ggplot2)

# 구글 지도 API키 설정
register_google(key = "AIzaSyDdfoNg3z3_dp1TVM8jv9TFqOaq57eBN9c")

# 지역명
names <- c("도담삼봉/석문", "구담봉/옥순봉", "사인암", "하선암", "중선암", "상선암")

# 주소
addr <- c("충청북도 단양군 매포읍 삼봉로 644-33", 
          "충청북도 단양군 단성면 월악로 3827", 
          "충청북도 단양군 대강면 사인암2길 42", 
          "충청북도 단양군 단성면 선암계곡로 1337", 
          "충청북도 단양군 단성면 선암계곡로 868-2",
          "충청북도 단양군 단성면 선암계곡로 790")

# 주소지의 위도 경도
gc <- geocode(enc2utf8(addr))
gc

# 단양팔경 이름, 경도, 위도
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
df

# 지도 중심좌표 설정
cen <- c((max(df$lon) + min(df$lon)) / 2, (max(df$lat) + min(df$lat)) / 2)
cen

# 지도정보 생성
map <- get_googlemap(center = cen,
                     markers = gc,
                     maptype = "roadmap",
                     zoom = 12)

# 지도 출력
ggmap(map)

gmap <- ggmap(map)

# 지도위에 지역명 출력
gmap + geom_text(data = df, 
                 aes(x = lon, y = lat),   #위치 설정
                 size = 5,                #출력문자크기
                 label = df$name)         #출력문자

# --------------------------------------------------------------------------------------------------------
# 지진 발생지역 분포
# 한해동안 발생한 우리나라 지진발생 데이터를 이용해서 지도에 표시하고 분포를 파악해 보자

# 1. 구글 지도 API정보 설정 : register_google()
# 2. 지진데이터 세트 읽기 : read.xlsx()
# 3. 데이터 정제
# 4. 지도 중심좌표 설정 : geocode()
# 5. 구글 지도정보 생성 : get_googlemap()
# 6. 지도 출력 : ggmap()
# 7. 지진규모 출력 : geom_point()

install.packages("readxl")
library(readxl)

earthquake <- read_xlsx("20200101_20201203.xlsx")
View(earthquake)

df <- earthquake
df
head(df)
tail(df)

# 데이터 정제 : 엑셀시트 원본에 있는 위도 숫자 뒤의 "N" 제거, 경도 숫자 뒤의 "E" 제거
df2 <- data.frame(lon = df[, 5], lat = df[, 6], mag = df[, 3])
str(df2)
df2

df2[, 1] <- gsub("N", "", df2[, 1])
df2[, 2] <- gsub("E", "", df2[, 2])
str(df2)

# 내가 한 데이터 변환 : 이렇게 해도 상관없음
# df2$위도 <- as.numeric(gsub("N", "", df2$위도))
# df2$위도
# df2$경도 <- as.numeric(gsub("E", "", df2$경도))
# df2$경도

install.packages("writexl")
library(writexl)
write_xlsx(df2, path = "df2.xlsx")

# Factor로 되어 있는 데이터 유형을 계산이 가능한 숫자형으로 변환
df2[, 1] <- as.numeric(as.character(df2[, 1]))
df2[, 2] <- as.numeric(as.character(df2[, 2]))
df2[, 3] <- as.numeric(as.character(df2[, 3]))
str(df2)

cen <- c((max(df2$경도) + min(df2$경도))/2, (max(df2$위도) + min(df2$위도))/2)
cen

# 지도 정보 저장
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 6)

# 지도 출력
ggmap(map)

gmap <- ggmap(map)

# 지도위에 점(도형) 표시
gmap + geom_point(data = df2,
                  aes(x = 경도, y = 위도, size = 규모),
                  col = "red",
                  alpha = 0.5
                  ) +
  scale_size_continuous(range = c(1, 14))
