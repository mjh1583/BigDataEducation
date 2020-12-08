# 지역별 미세먼지 농도 비교 : 지도
# 지도에서 원의크기는 각 지역별 농도 크기 표시한 것임
# 1) 대기오염정보 조회 API 설정
# 2) URL 작성
# 3) 실시간 시도별 평균 정보 조회 API 호출 : xmlParse()
# 4) 미세먼지 데이터 프레임 변환 : xmlToDataFrame()
# 5) 구글 지도 API키 설정 : register_google()
# 6) 지역별 좌표 검색 : geocoding()
# 7) 지도 중심 좌표 설정 : geocoding()
# 8) 구글 지도 정보 생성 : get_googlemap()
# 9) 지도 출력 : ggplot() + geom_plot()

# 미세먼지 XML 문서 출력
library(XML)
library(ggplot2)
library(ggmap)

api <- "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst"
 
api_key <- "vnQ8qzCuLWxE4VOBh15IyPY3IItPKTsswJ%2BVAbEtKvYJHVJg39ySWWmzUl0ndH8vLnqdD%2F64culCtcSWf4NPCg%3D%3D"

numOfRows <- 10
pageNo <- 1
itemCode <- "PM10" 
dataGubun <- "HOUR"
searchCondition <- "MONTH"

url <- paste(api,
             "?serviceKey=", api_key,
             "&numOfRows=", numOfRows,
             "&pageNo=", pageNo,
             "&itemCode=", itemCode,
             "&dataGubun=", dataGubun,
             "&searchCondition=", searchCondition,
             sep = "")

xmlFile <- xmlParse(url)
xmlFile

# -----------------------------------------------------------------------------------------------------
# 특정 시간대의 지역별 미세먼지 농도 추출
df <- xmlToDataFrame(getNodeSet(xmlFile, "//items/item"))
df

pm <- df[1, 4:20]
pm

# 지역별 미세먼지 농도의 지도 출력
register_google(key = "AIzaSyDdfoNg3z3_dp1TVM8jv9TFqOaq57eBN9c")

cities <- c("서울시", "부산시", " 대구시", "인천시", "광주시", "대전시", "울산시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주시", "세종")

# 지역별 좌표 검색(위도, 경도)
gc <- geocode(enc2utf8(cities))
gc

# 지역별 미세먼지 정보의 데이터 프레임
df2 <- data.frame(지역명 = cities,
                     미세먼지 = t(pm),
                     경도 = gc$lon,
                     위도 = gc$lat,
                     stringsAsFactors = F)
df2

# 두번째 열이름을 "미세먼지"로 변경
names(df2)[2] <- "미세먼지"
df2

str(df2)

# 지도에 원의 크기에 반영하기 위해 미세먼지의 데이터유형을 숫자형으로 변환
df2[, 2] <- as.numeric(df2[, 2])

# 지도 중심 좌표 설정
# cen <- c((max(gc$lon) + min(gc$lon))/2, (max(gc$lat) + min(gc$lat))/2)
cen <- as.numeric(geocode(enc2utf8("전라북도")))

# 구글 지도 정보 생성
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 7)

# 지도 출력
ggmap(map)

gmap <- ggmap(map)

gmap + geom_point(data = df2,                                 
             aes(x = 경도, y = 위도),   
             alpha = 0.5,
             size = df2$미세먼지*0.3,
             col = rainbow(length(df2$미세먼지))) +
 scale_size_continuous(c())


# 지역별 당일 평균 미세먼지 농도 지도에 시각화
# names <- c("서울", "부산", "대구", "인천", "광주", "대전", "울산", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주", "세종")
# 
# size = c(mean(as.numeric(df$seoul)), mean(as.numeric(df$busan)), mean(as.numeric(df$daegu)), mean(as.numeric(df$incheon)), mean(as.numeric(df$gwangju)), mean(as.numeric(df$daejeon)), mean(as.numeric(df$ulsan)), mean(as.numeric(df$gyeonggi)), mean(as.numeric(df$gangwon)), mean(as.numeric(df$chungbuk)), mean(as.numeric(df$chungnam)), mean(as.numeric(df$jeonbuk)), mean(as.numeric(df$jeonnam)), mean(as.numeric(df$gyeongbuk)), mean(as.numeric(df$gyeongnam)), mean(as.numeric(df$jeju)), mean(as.numeric(df$sejong)))
# 
# gc <- geocode(enc2utf8(names))
# gc
# 
# cen <- c((max(gc$lon) + min(gc$lon))/2, (max(gc$lat) + min(gc$lat))/2)
# cen
# 
# df
# 
# df2 <- data.frame(name = names, size = size, lon = gc$lon, lat = gc$lat)
# df2
# 
# map <- get_googlemap(center = cen,
#                      maptype = "roadmap",
#                      zoom = 7)
# 
# ggmap(map)
# 
# gmap <- ggmap(map)
# 
# gmap + geom_point(data = df2, 
#                   aes(x = lon, y = lat, size = size),
#                   alpha = 0.5,
#                   col = "red") +
#   scale_size_continuous(c(1, 5))
