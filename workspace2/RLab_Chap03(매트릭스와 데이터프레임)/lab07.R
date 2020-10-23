# 데이터 가져오기와 내보내기

# 주요함수
# read.csv("파일.csv") : csv형식의 데이터 파일을 데이터 프레임으로 불러옴
# write.csv(x, "파일.csv") : 데이터 프레임을 csv 형식 파일로 내보냄

# read_excel("파일.xlsx") : 엑셀형식의 데이터 파일을 데이터 프레임으로 불러옴
# write_excel(x, "파일.xlsx") : 데이터 프레임을 엑셀 형식 파일로 내보냄

# sink() : 출력 결과를 계속 기록
# cat() : 분석 결과를 외부 파일로 내보냄

# save() : 변수를 파일로 저장
# load() : 파일에서 저장된 변수를 불러옴

# csv(Comma-Seperated Values)
install.packages("readxl")
install.packages("writexl")
library(readxl)
library(writexl)

x <- read.csv("reservation_r_csv.csv")
head(x)

y <- read_excel("reservation_r_excel.xlsx")
head(y)

write.csv(reservation_r_csv, "csv_output.csv")
write_xlsx(y, "excel_output.xlsx")

# sink() 함수 : 분석 결과값 저장하기
sink("output.txt")  #출력을 output.txt에 기록시작
x <- 1
y <- 2
x
y
x+y
sink()    #기록 마침

# save() : 변수를 파일에 저장하는 함수 (.Rdata)
# load() : 변수를 불러오는 함수

x <- c(1, 2, 3)
y <- c(4, 5, 6)
save(x, y, file = "save.Rdata")  # 변수 저장

rm(x)
rm(y)
rm(list = ls())  # 메모리의 변수를 모두 삭제

load("save.Rdata")  # save.Rdata에 저장한 변수 불러옴

x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c(7, 8, 9)
save(list = ls(), file = "save2.Rdata" )

rm(list = ls())
load("save2.Rdata")
