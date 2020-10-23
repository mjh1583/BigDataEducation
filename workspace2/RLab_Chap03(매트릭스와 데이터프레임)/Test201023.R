# 연습문제 1
vc.1 <- c(95, 86, 47, 55, 68)
vc.1

# 연습문제 2
vc.2 <- seq(100,200,2)
vc.2

# 연습문제 2
vc.3 <- rep(TRUE, 20)
vc.3

# 연습문제 4
d <- seq(100, 200, 1)
d
d[10]
tail(d,10)
d[seq(2, 100, 2)]
d[seq(3, 100, 3)]
d.20 <- head(d, 20)
d.20
d.20[-5]
d.20[c(-5, -7, -9)]

# 연습문제 5
absent <- c(10, 8,14, 15, 9, 10, 15, 12, 9, 7, 8, 7)
names(absent) <- c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")
absent
absent[5]            
absent[c(7,9)]
sum(absent[c(1:6)])
mean(absent[c(7:12)])
