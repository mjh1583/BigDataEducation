# 웹크롤링(Web Crawling) : 포털 등에서 자동으로 웹사이트의 링크 정보를 수집하여 저장하는 기술

# 웹스크래핑(Web Scrapping) : 웹사이트로부터 웹문서를 다운로드 받아 필요한 정보를 추출하는 기술

# R(데이터 추출) <========= 웹사이트(웹문서) : HTML

# 브라우저가 HTML문서를 파싱하여 브라우저의 도큐먼트 영역에 랜더링할때 HTML 문서를 구성하는 모든 태그의 속성, 콘텐츠들을 DOM(Document Object Model)이라는 규격을 적용하여 JavaScript 객체를 생성함.

# DOM : 구조화된 문서의 표현 형식
# 프로그래밍 언어가 특정 부분에 쉽게 접근할 수 있도록 함.

# 오픈 API 목록 아이템
# 오픈 API 목록 아이템 설명

# DOM구조
# Element <html>
#     |
#     |------Element <head>
#     |------Element <body>
#                      |
#                      |-----Element <div>
#                               |
#                               |------<ul>
#                                       |
#                                       |----<li>
#                                             |
#                                             |---Element <span>-----Attribute
#                                                                    class="title" : 오픈 API 목록 아이템 제목
# 공공데이터포털의 목록 추출(단일페이지)
# 1. 웹페이지 URL 설정
# 2. 웹페이지 읽기 : read_html()
# 3. 목록 아이템 제목 추출 : html_nodes()
# 4. 목록 아이템 개요 추출 : html_nodes()
# 5. 데이터 정제 : gusb()
# 6. 데이터 출력 : data.frame()

# 패키지 설치 및 로딩
install.packages("rvest")
library(rvest)

# 웹문서 읽기
url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do?dType=API&keyword=%ED%95%9C%EA%B5%AD%EC%A1%B0%ED%8F%90%EA%B3%B5%EC%82%AC&detailKeyword=&publicDataPk=&recmSe=&detailText=&relatedKeyword=&commaNotInData=&commaAndData=&commaOrData=&must_not=&tabId=&dataSetCoreTf=&publicDataPks=&coreDataNm=&sort=&relRadio=&orgFullName=&orgFilter=&org=&orgSearch=&currentPage=1&perPage=10&brm=&instt=&svcType=&kwrdArray=&extsn=&coreDataNmArray="


# read_html() : 웹문서 읽기 ==> XML문서(디폴트)
html <- read_html(url)
html

# 목록 아이템 추출
title <- html_nodes(html, "#apiDataList .title") %>% 
  html_text()

title

# 목록 아이템 설명 추출
# html_text() : html문서에서 노드내의 데이터 추출
desc <- html_nodes(html, "#apiDataList .ellipsis") %>% html_text()
desc

# 데이터 정제 : 제어문자를 공백으로 대체
# gsub() : HTML문서에서 노드 추출출
title <- gsub("[|\r|\n|\t]", "", title)
# title <- gsub("\\r|\\n|\\t", "", title) ---위와 같음

# 데이터 출력
api <- data.frame(title, desc)
api
