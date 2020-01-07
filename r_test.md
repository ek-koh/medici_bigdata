wt <- read.csv("weather_data.csv")
str(wt)

### 1
# raintomorrow 컬럼은 "Yes"를 1로, "No"를 0으로 변경
wt$raintomorrow <- ifelse(wt$raintomorrow == "Yes", 1, 0)

# 누락값 인덱스 함수 만들기
na_idx <- function(x) {
  return(which(is.na(x)))
}

# 누락값 가진 컬럼 찾기
apply(wt, 2, na_idx)    # sunshine, windgustspeed에 NA 존재

# 누락값 가진 행 전체 몇 개?
sum(is.na(wt))          # 5개

# 누락값 대체하기
wt$sunshine <- 
  ifelse(is.na(wt$sunshine),
         round(mean(wt$sunshine, na.rm = T), 2),
         wt$sunshine)

wt$windgustspeed <- 
  ifelse(is.na(wt$windgustspeed),
         round(mean(wt$windgustspeed, na.rm = T), 2),
         wt$windgustspeed)

### 2

sorted <- sort(abs(cor(wt)[10,-10]), decreasing = T)[1:3]
names(sorted)  # "cloud"    "sunshine" "pressure"

### 3
# 훈련, 테스트 데이터 세트 구분하기
train <- wt[wt$xgrp == 1,]
test <- wt[wt$xgrp == 0,]
# 분석에 필요 없는 xgrp 변수 제거
wt <- wt[,-11]
train <- train[,-11]
test <- test[,-11]

# 로지스틱 회귀분석
model.glm <- glm(raintomorrow ~ ., 
                 data = train, family = binomial)
summary(model.glm)

# 새로운 데이터 입력과 예측값 만들기
newdata <- data.frame(tempmin=17.2, tempmax=25.8, rainfall=0, sunshine=8.8, windgustspeed=41, windspeed=6, humidity=74, pressure=1011.5, cloud=7)
pred <- predict(model.glm, newdata = newdata)

round(pred, 2) # 비가 올 확률은 0.84
(raintomorrow <- ifelse(pred >= 0.5, 1, 0)) # 비가 올 것이다.

### 4
pred1 <- predict(model.glm, newdata = test)
test$pred1 <- ifelse(pred1 >= 0.5, 1, 0)

table(pred = test$pred1, real = test$raintomorrow)
pro <- prop.table(table(pred = test$pred1, real = test$raintomorrow))

## 정확도 정답: 0.9181818
accuracy <- pro[1,1] + pro[2,2]
accuracy
