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

# URL 작성
# API에 매개변수 = 매개변수 값
# 첫번째 매개변수 앞에는 '?', 두번째부터는 '&'
url <- paste(api, 
             "?serviceKey=", api_key,
             "&numOfRows=", numOfRows,
             "&pageNo=", pageNo,
             "&itemCode=", itemCode,
             "&dataGubun=", dataGubun,
             "&searchCondition=", searchCondition,
             sep = "")

url

# API호출(XML 문서로 다운로드 받음)
# xmlParse() : XML 또는 HTML 파일에 대해 R에서 인식하는 구조로 변환
xmlFile <- xmlParse(url)

# 다운로드 받은 XML문서 확인
# xmlRoot() : XML 문서 객체의 루트 노드에 접근하는 기능 제공
#             매개변수 -- XML 문서 객체
xmlRoot(xmlFile)

# ----------------------------------------------------------------------------------------------------

# R : XML문서를 데이터프레임으로 변환

# items 노드 내에 여러 item 노드들을 데이터 프레임으로 변환
# xmlToDataFrame() : XML 문서로부터 데이터 추출
df <- xmlToDataFrame(getNodeSet(xmlFile, "//items/item"))
df
# 시간대별 각 지역 미세먼지 농도 확인

# -----------------------------------------------------------------------------------------------------
# R : 미세먼지 농도의 그래프
ggplot(data = df, aes(x = dataTime, y = gyeongbuk)) + 
  geom_bar(stat = "identity", fill = "green") 

# geom_bar() : 막대 그래프로 출력
# 매개변수 - stat = identity : 막대 높이를 데이터에 맞추어 출력 / bin : 데이터 그룹별 분류
#            fill = 막대그래프 색상

# 라벨 수정
ggplot(data = df, aes(x = dataTime, y = gyeongbuk)) + 
  geom_bar(stat = "identity", fill = "green") +
  theme(axis.title.x = element_text(angle = 90), axis.text.x = element_text(angle = 90)) + # x축 눈금 라벨 회전 각도
  labs(title = "시간대별 경북지역의 미세먼지 농도 변화", x = "측정일시", y= "농도")

# 막대 색
ggplot(data = df, aes(x = dataTime, y = gyeongbuk, fill = dataTime)) + 
  geom_bar(stat = "identity") +
  theme(axis.title.x = element_text(angle = 90), axis.text.x = element_text(angle = 90)) + # x축 눈금 라벨 회전 각도
  labs(title = "시간대별 경북지역의 미세먼지 농도 변화", x = "측정일시", y= "농도") + 
  scale_fill_manual(values = rainbow(10))

# 범례삭제
ggplot(data = df, aes(x = dataTime, y = gyeongbuk, fill = dataTime)) + 
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90), legend.position = "none") + # x축 눈금 라벨 회전 각도
  labs(title = "시간대별 경북지역의 미세먼지 농도 변화", x = "측정일시", y= "농도") + 
  scale_fill_manual(values = rainbow(10))

# 가로 막대 출력
ggplot(data = df, aes(x = dataTime, y = gyeongbuk, fill = dataTime)) + 
  geom_bar(stat = "identity") +
  theme(legend.position = "none") + # x축 눈금 라벨 회전 각도
  labs(title = "시간대별 경북지역의 미세먼지 농도 변화", x = "측정일시", y= "농도") + 
  scale_fill_manual(values = rainbow(10)) +
  coord_flip() # 가로출력 : 그래프의 수평과 수직 축을 서로 바꿈
