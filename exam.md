---
title: "exam"
output: html_document
---



## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
summary(cars)
```

```
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

```r
wt <- read.csv("weather_data.csv")
```

```
## Warning in file(file, "rt"): 파일 'weather_data.csv'를 여는데 실패
## 했습니다: No such file or directory
```

```
## Error in file(file, "rt"): 커넥션을 열 수 없습니다
```

```r
str(wt)
```

```
## Error in str(wt): 객체 'wt'를 찾을 수 없습니다
```

```r
### 1
# raintomorrow 컬럼은 "Yes"를 1로, "No"를 0으로 변경
wt$raintomorrow <- ifelse(wt$raintomorrow == "Yes", 1, 0)
```

```
## Error in ifelse(wt$raintomorrow == "Yes", 1, 0): 객체 'wt'를 찾을 수 없습니다
```

```r
# 누락값 인덱스 함수 만들기
na_idx <- function(x) {
  return(which(is.na(x)))
}

# 누락값 가진 컬럼 찾기
apply(wt, 2, na_idx)    # sunshine, windgustspeed에 NA 존재
```

```
## Error in apply(wt, 2, na_idx): 객체 'wt'를 찾을 수 없습니다
```

```r
# 누락값 가진 행 전체 몇 개?
sum(is.na(wt))          # 5개
```

```
## Error in eval(expr, envir, enclos): 객체 'wt'를 찾을 수 없습니다
```

```r
# 누락값 대체하기
wt$sunshine <- 
  ifelse(is.na(wt$sunshine),
         round(mean(wt$sunshine, na.rm = T), 2),
         wt$sunshine)
```

```
## Error in ifelse(is.na(wt$sunshine), round(mean(wt$sunshine, na.rm = T), : 객체 'wt'를 찾을 수 없습니다
```

```r
wt$windgustspeed <- 
  ifelse(is.na(wt$windgustspeed),
         round(mean(wt$windgustspeed, na.rm = T), 2),
         wt$windgustspeed)
```

```
## Error in ifelse(is.na(wt$windgustspeed), round(mean(wt$windgustspeed, : 객체 'wt'를 찾을 수 없습니다
```

```r
### 2

sorted <- sort(abs(cor(wt)[10,-10]), decreasing = T)[1:3]
```

```
## Error in is.data.frame(x): 객체 'wt'를 찾을 수 없습니다
```

```r
names(sorted)  # "cloud"    "sunshine" "pressure"
```

```
## Error in eval(expr, envir, enclos): 객체 'sorted'를 찾을 수 없습니다
```

```r
### 3
# 훈련, 테스트 데이터 세트 구분하기
train <- wt[wt$xgrp == 1,]
```

```
## Error in eval(expr, envir, enclos): 객체 'wt'를 찾을 수 없습니다
```

```r
test <- wt[wt$xgrp == 0,]
```

```
## Error in eval(expr, envir, enclos): 객체 'wt'를 찾을 수 없습니다
```

```r
# 분석에 필요 없는 xgrp 변수 제거
wt <- wt[,-11]
```

```
## Error in eval(expr, envir, enclos): 객체 'wt'를 찾을 수 없습니다
```

```r
train <- train[,-11]
```

```
## Error in eval(expr, envir, enclos): 객체 'train'를 찾을 수 없습니다
```

```r
test <- test[,-11]
```

```
## Error in eval(expr, envir, enclos): 객체 'test'를 찾을 수 없습니다
```

```r
# 로지스틱 회귀분석
model.glm <- glm(raintomorrow ~ ., 
                 data = train, family = binomial)
```

```
## Error in is.data.frame(data): 객체 'train'를 찾을 수 없습니다
```

```r
summary(model.glm)
```

```
## Error in summary(model.glm): 객체 'model.glm'를 찾을 수 없습니다
```

```r
# 새로운 데이터 입력과 예측값 만들기
newdata <- data.frame(tempmin=17.2, tempmax=25.8, rainfall=0, sunshine=8.8, windgustspeed=41, windspeed=6, humidity=74, pressure=1011.5, cloud=7)
pred <- predict(model.glm, newdata = newdata)
```

```
## Error in predict(model.glm, newdata = newdata): 객체 'model.glm'를 찾을 수 없습니다
```

```r
round(pred, 2) # 비가 올 확률은 0.84
```

```
## Error in eval(expr, envir, enclos): 객체 'pred'를 찾을 수 없습니다
```

```r
(raintomorrow <- ifelse(pred >= 0.5, 1, 0)) # 비가 올 것이다.
```

```
## Error in ifelse(pred >= 0.5, 1, 0): 객체 'pred'를 찾을 수 없습니다
```

```r
### 4
pred1 <- predict(model.glm, newdata = test)
```

```
## Error in predict(model.glm, newdata = test): 객체 'model.glm'를 찾을 수 없습니다
```

```r
test$pred1 <- ifelse(pred1 >= 0.5, 1, 0)
```

```
## Error in ifelse(pred1 >= 0.5, 1, 0): 객체 'pred1'를 찾을 수 없습니다
```

```r
table(pred = test$pred1, real = test$raintomorrow)
```

```
## Error in table(pred = test$pred1, real = test$raintomorrow): 객체 'test'를 찾을 수 없습니다
```

```r
pro <- prop.table(table(pred = test$pred1, real = test$raintomorrow))
```

```
## Error in table(pred = test$pred1, real = test$raintomorrow): 객체 'test'를 찾을 수 없습니다
```

```r
## 정확도 정답: 0.9181818
accuracy <- pro[1,1] + pro[2,2]
```

```
## Error in eval(expr, envir, enclos): 객체 'pro'를 찾을 수 없습니다
```

```r
accuracy
```

```
## Error in eval(expr, envir, enclos): 객체 'accuracy'를 찾을 수 없습니다
```

## Including Plots

You can also embed plots, for example:

![plot of chunk pressure](figure/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
