# 공공데이터 포탈 (www.data.go.kr) 
# 오픈 API : 날씨, 교통정보 등 실시간 데이터를 제공받기 위해서 호출하는 API

# 활용기관                                                         제공기관
# : 개인(개발자), API키 신청                     API키 신청
# 민간기관, ================> data.go.kr    ==================>  오픈 API등록
# 공공기관, <===============  (파일데이터,  <=================   인증키 관리
# 행정기관        API키        API관리)           API키

# 패키지 :
# ggplot2(그래프출력을 위한 고급 시각화 패키지)
# ggmap(지도 출력)
# XML(웹에 연결된 XML, HTML문서 읽음)

# 미세먼지 농도의 시간대별 변화 (막대 그래프)
# 1. 대기오염정보 조회 API 설정
# 2. URL 작성
# 3. 실시간 시도별 평균 정보 조회 API 호출 : xmlParse()
# 4. 미세먼지 데이터 프레임 변환 : xmlToDataFrame()
# 5. 바차트 출력 : ggplot() + geom_bar()

install.packages("XML")
library(XML)
library(ggplot2)
library(ggmap)

# API 설정(한줄로 작성)
api <- "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst"

# API 키(공공데이터 포털에서 승인 받은 키) 
api_key <- ""

# 한 페이지에 표현할 데이터 행의 수
numOfRows <- 10

# 출력할 페이지 번호
pageNo <- 1

# 아이템 코드 : 미세먼지 
itemCode <- "PM10" 

# 미세먼지의 시간 단위 평균 
dataGubun <- "HOUR"

# 요청데이터 기간 : 한달간
searchCondition <- "MONTH"

