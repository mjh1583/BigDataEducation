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

# 데이터 탐색 -------------------------------------------------------------------------------------------
str(ds.total)

# unique() 함수 : 중복된 값을 하나만 나오게 하는 함수
unique(ds.total$수집연월)
unique(ds.total$상권업종대분류명) # 9개
unique(ds.total$상권업종중분류명) # 102개
unique(ds.total$상권업종소분류명) # 772개

# NA포함여부
sum(is.na(ds.total))

# 201712 수집 데이터만 추출
ds.201712 <- subset(ds.total, ds.total$수집연월 == 5)
head(ds.201712)
dim(ds.201712)

# 업종별 점포수(대분류) 그래프 작성
store.level_1 <- aggregate(ds.201712[, 1], by = list(대분류 = ds.201712$상권업종대분류명), FUN = length)
store.level_1

# x라는 열이름 대신에 count로 바꾸기
names(store.level_1)[2] <- "count"
store.level_1

# 막대그래프 그리기
ggplot(store.level_1, aes(x = 대분류, y = count)) + 
  geom_bar(stat = "identity", width = 0.8, fill = "blue") +
  ggtitle("업종별(대분류) 점포 수") + 
  theme(plot.title = element_text(color = "black", size = 20, face = "bold"))

# 구별 점포수 그래프 작성
store.region <- aggregate(ds.201712[, 1], by = list(구이름 = ds.201712$시군구명), FUN = length)
store.region

# x라는 열이름 대신에 count로 바꾸기
names(store.region)[2] <- "count"
store.region

# 막대그래프 그리기
ggplot(store.region, aes(x = 구이름, y = count)) + 
  geom_bar(stat = "identity", width = 0.8, fill = "blue") +
  ggtitle("구별 점포 수") + 
  theme(plot.title = element_text(color = "black", size = 20, face = "bold"), 
        axis.text.x = element_text(angle = 45))

# 지도 위에 구별 점포수 표시
store.region.loc <- aggregate(ds.201712[, c("경도", "위도")], by = list(구이름 = ds.201712$시군구명), FUN = mean)
store.region.loc

# 구별 통계에다가 경도와 위도를 합쳐서 데이터 프레임 생성하기
store.region <- data.frame(store.region, store.region.loc[, 2:3])
store.region

# API 키 등록
register_google(key = "")

# 전체 지도의 중심점 계산
cen <- c(mean(store.region$경도), mean(store.region$위도))
cen

# 지도 얻기
map <- get_googlemap(center = cen,
                     zoom = 11,
                     maptype = "roadmap",
                     size = c(640, 640))
ggmap(map)                     

gmap <- ggmap(map)

gmap + geom_point(data = store.region, 
                  aes(x = 경도, y = 위도, size = count),
                  alpha = 0.5,
                  col = "red") +
  scale_size_continuous(range = c(1, 18)) +   #원의 크기 조절
  geom_text(data = store.region,
            aes(x = 경도, y = 위도),          #텍스트 위치
            size = 3,                         #텍스트 크기
            label = store.region$구이름)      #텍스트 내용
