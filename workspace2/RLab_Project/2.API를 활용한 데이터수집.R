# R에서 API호출 데이터 수집 코드 작성
# 지역코드 데이터 수집 : region_cd.csv
# API 호출 코드 작성
#   1) 지역코드(LAWD_CD) 목록 생성
#   2) 연월(DEAL_YMD) 목록 생성
#   3) 반목문으로 지역/연월별 API 호출

#   2) 연월(DEAL_YMD) 목록 생성

c(2010:2020)
c(1:12)

x <- c(1,2,3,4,5)   #x와 y를 행으로 합침
y <- c(6,7,8,9,10)  #x와 y를 열로 합침

rbind(x,y)
cbind(x,y)

df <- data.frame(name = c("a", "b"), score = c(80, 60)) #데이터 프레임 생성
df
cbind(df, rank = c(1, 2)) #rank 열 추가

x <- data.frame(name = c("a", "b", "c"), height = c(170, 180, 160)) #데이터 프레임 생성
x

y <- data.frame(name = c("c", "b", "a"), weight = c(50, 70, 60)) #데이터 프레임 생성
y

merge(x, y) #데이터 병합
cbind(x, y) 

# 계약월 6자리
temp <- merge(c(2010:2020), c(1:12))
temp$y <- if_else(temp$y < 10, paste0(0, temp$y), as.character(temp$y))
DEAL_YMD <- paste0(temp$x, temp$y) %>% as.integer()
DEAL_YMD

# 3) 반목문으로 지역/연월별 API 호출
# 지역별/년월일 데이터 수집
install.packages("XML")
library(XML)

API_KEY <- "vnQ8qzCuLWxE4VOBh15IyPY3IItPKTsswJ%2BVAbEtKvYJHVJg39ySWWmzUl0ndH8vLnqdD%2F64culCtcSWf4NPCg%3D%3D"

for(i in LAWD_CD$code5){
  print
  for(l in DEAL_YMD){
    url <- paste0("http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?LAWD_CD=ServiceKey=", API_KEY, "&LAWD_CD=", i, "&DEAL_YMD=", l)
    raw.data <- xmlTreeParse(url, useInternalNodes = T)
    raw.data
    xml_rootNode <- try(xmlRoot(raw.data))
    xml_rootNode
    xml_result <- xmlToDataFrame(xml_rootNode[[2]][['items']])
    df <- rbind(df, xml_result)
  }
}
df







