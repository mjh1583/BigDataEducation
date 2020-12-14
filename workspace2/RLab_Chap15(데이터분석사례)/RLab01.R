# 분석 대상 데이터 준비

# 지도 서비스의 중요성
# 공공데이터 포털사이트에서 상가정보를 다운로드함.
# 서울시 자료만 따로 추출
# 서울시 상가정보 : 2015년 12월, 2016년 6월, 12월, 2017년 6월, 12월. 총 5회에 걸쳐 조사된 것
# 데이터가 들어있는 파일들에서 필요한 열만 선택한 후, 5개 파일을 하나로 합치는 작업 예정.

install.packages("readxl")
library(ggplot2)
library(ggmap)
library(readxl)

files <- c("201512", "201606", "201612", "201706", "201712")
columns <- c("상가업소번호", "상호명", "상권업종대분류명", "상권업종중분류명", "상권업종소분류명", "시군구명", "행정동명", "경도", "위도")

ds.total <- NULL

for(i in 1:length(files)){
  filename <- paste("seoul_", files[i], ".xlsx", sep = "")  #파일 이름 만들기
  cat("read", filename, "...\n")  #읽을 파일 이름 콘솔에 출력하기
  ds <- read_excel(filename)      #엑셀 파일 읽기
  ds <- data.frame(ds)            #데이터프레임으로 변환하기
  ds <- ds[, columns]             #분석에 필요한 변수만 추출하기
  ds$수집연월 <- rep(i, nrow(ds)) #데이터 수집 시점명명(1, 2, 3, 4, 5)
  ds.total <- rbind(ds.total, ds) #5개의 읽은 엑셀파일을 ds.total데이터 프레임에 붙이기
}

head(ds.total)





