install.packages("readxl")
install.packages("lattice")
library(readxl)
library(lattice)
library(ggplot2)

mrc_info <- read.csv("mrc_info.csv", header = T, stringsAsFactors = FALSE)
samp_cst_feat <- read.csv("samp_cst_feat.csv", header = T, stringsAsFactors = FALSE)
samp_train <- read.csv("samp_train.csv", header = T, stringsAsFactors = FALSE)
variable_dtype <- read_excel("variable_dtype.xlsx")

# label이 될 컬럼을 factor로 변환
samp_cst_feat$VAR007 <- factor(samp_cst_feat$VAR007, levels = c(0, 1))

# 데이터를 셔플
set.seed(123)
samp_cst_feat_shuffle <- samp_cst_feat[sample(nrow(samp_cst_feat)), ]

# 필요없는 데이터 제거 후 재할당
samp_cst_feat2 <- samp_cst_feat[-1]

# 데이터 정규화
normalize <- function(x) {
  return( x-min(x)/ (max(x)- min(x)) )
}
ncol <- which(colnames(samp_cst_feat2) == "VAR007")

samp_cst_feat_n <- as.data.frame(lapply(samp_cst_feat2[-ncol], normalize))

samp_cst_feat_n <- cbind(samp_cst_feat2[1], samp_cst_feat_n)

# train 데이터와 test데이터로 나눔
train_num <- round(0.9*nrow(samp_cst_feat_n), 0)
samp_cst_feat_train <- samp_cst_feat_n[1:train_num, ]
samp_cst_feat_test <- samp_cst_feat_n[(train_num+1):nrow(samp_cst_feat_n), ]

# label과 데이터를 나눔
samp_cst_feat_train_label <- samp_cst_feat2[1:train_num, 1]
samp_cst_feat_test_label <- samp_cst_feat2[(train_num+1):nrow(samp_cst_feat_n),1]

# 가장 좋은 k 값을 찾음
install.packages("caret")
install.packages("e1071")
library(caret)
library(e1071)

repeats = 10
numbers = 10
tunel = 10

set.seed(1234)

samp_cst_feat_train <- samp_cst_feat_train[-1]

x = trainControl(method = "repeatedcv", number = numbers, repeats = repeats, classProbs = TRUE, summaryFunction = twoClassSummary)

model1 <- train(VAR015~., data = samp_cst_feat_train, method = "knn", preProcess = c("center", "scale"), trControl = x, metric = "ROC", tuneLength = tunel)

k_n <- max(model1$bestTune)

library(class)

result1 <- knn(train = table_train, test =)
