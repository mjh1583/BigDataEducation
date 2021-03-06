# 룰랫 돌리기
# 1) 룰랫 이미지 읽기
# 2) 룰렛 이미지 크기 변환
# 3) 회전수(난수) 생성
# 4) 이미지 회전 각도 변경
# 5) 이미지 회전
# 6) 기준점 설정
# 7) 이미지와 기준점 출력
# 8) 실행대기

install.packages("imager")
library(imager)

# 이미지 경로
img_path <- "C:\\workspace2\\data\\roulette.png"

# 이미지 파일 읽기
img <-  load.image(img_path)

# 이미지 출력
plot(img)

# 룰렛 이미지 변환
img <- resize(img, size_x = 400L, size_y = 400L)

# 이미지 출력
plot(img,xlim = c(0, 400), ylim = c(0, 400))

# 이미지 출력(가로, 세로 축 제거)
plot(img,xlim = c(0, 400), ylim = c(0, 400),axes = FALSE)

# 룰렛 회전수(난수) 생성 : 11~20 사이의 정수 1개 추출
rot.count <- sample(11:20, 1)
rot.count

#회전 각도 초기화
angle <- 0
for (i in 1:rot.count) { # 1부터 회전수까지 반복
  angle <- angle + 36 # 회전각도 설정(1회 반복마다 36도 증가)

  #차트 제목 설정
  title <- paste("룰랫 회전 :", i, "/", rot.count)
  
  #이미지 출력
  imrotate(img, angle, cx = 200, cy = 200) %>% 
    # 이미지위에 원 출력
    # x,y 위치에 반지름 30인 원 그리기
    # 배경색 : 적색(투명도)
    draw_circle(x = 200, y = 30 ,radius = 30, col=c(1, 0, 0, 0), opacity = 0.5) %>% 
    plot(axes = FALSE, main = title)
    Sys.sleep(0.2) #0.2초 실행대기
}
#-------------------------------------------------------------------
# 심바가 정글

# 1) 이미지 읽기
# 2) 이미지 크기 변환
# 3) 애니메이션 반복 단계 초기화
# 4) '심바' 위치 초기화
# 5) while(true) : '심바' 위치 설정
# 6) 이미지 합성
# 7) 이미지 출력
# 8)애니메이션 실행 대기
# 9)애니메이션 반복 단계 1증가
# 10)'심바'의 수평위치(x) 변경

install.packages("magick")
library(magick)

lion_bg <- image_read("C:\\workspace2\\data\\lion_bg.png")
lion_1 <- image_read("C:\\workspace2\\data\\lion_1.png")
lion_2 <- image_read("C:\\workspace2\\data\\lion_2.png")

# 이미지 크기 변경(가로X세로 : 픽셀단위)
lion_bg <- image_scale(lion_bg, "600x300!")
lion_1 <- image_scale(lion_1, "100x50!")
lion_2 <- image_scale(lion_2, "100x50!")

print(lion_bg)
print(lion_1)
print(lion_2)

# 이미지 합성 테스트
img <- image_composite(lion_bg, lion_1, offset = "+100+200")
print(img)

# 이미지 이동 
moving <- 0 #애니메이션 반복 단계 초기화
x <- -100
y <- 150

while(TRUE){  #무한반복
  if(x < 0)
    position <- paste(x, "+", y, sep = "")
# 심바 위치 결정  
  else
    position <- paste("+", x, "+", y, sep = "")
  
  # 이미지 합성(애니메이션 반복 단계에 따른 심바 이미지 합성 변경)
  if(moving %% 2 == 0 ){
    img <- image_composite(lion_bg, lion_1, offset = position)
  }else{
    img <- image_composite(lion_bg, lion_2, offset = position)

  }
  #이미지 출력
  print(img)
  
  Sys.sleep(0.3) #애니메이션 실행 대기
  
  if(x > 600) #애니메이션 종료 여부
    break
  
  moving <- moving + 1 #반복 단계의 1증가
  
  x <- x + 20
}
