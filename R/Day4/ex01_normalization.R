wisc_bc <- read.csv("wisc_bc_data.csv", header = T, sep = ',',
                    stringsAsFactors = F)
str(wisc_bc)
summary(wisc_bc[-c(1,2)])
sum(complete.cases(wisc_bc))  # NULL값이 없다

# 1. id 컬럼을 제거하고, 로지스틱 회귀분석을
# 이용한 분류예측을 위해 악성(M)을 1로, 
# 양성(B)를 0으로 변경 후 악성과 양성의 빈도 구하기
wisc_bc <- wisc_bc[,-1]
str(wisc_bc)
bi <- ifelse(wisc_bc$diagnosis == "M", 1, 0)
wisc_bc$diagnosis <- bi
table(wisc_bc$diagnosis, useNA = "ifany")


# 2. 앞에서 469행까지는 훈련 데이터로,
# 이후 행은 검증 데이터로 사용해 로지스틱 회귀 분류 모델을 생성
# 이 때 radius_mean의 승산비 구하기

# minmax scaling 을 이용한 정규화
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

wbcd.n <- as.data.frame(lapply(wisc_bc[-1,], normalize))
summary(wisc_bc$area_mean)
summary(wbcd.n$area_mean)

train <- wbcd.n[1:469,]
test <- wbcd.n[470:569,]

model <- glm(diagnosis ~ ., data = train,
             family = binomial)
summary(model)
coefficients(model)
odd_ratio <- exp(coefficients(model))[2]
odd_ratio

# 3. 아래의 데이터에 대해 예측되는 분류 값을 구하십시오.
data <- wbcd.n[wbcd.n$diagnosis == 1,][1,-1]
cname <- colnames(wbcd.n)[-1]
data
data$radius_mean <- data$radius_mean * 1.2
data$area_mean <- data$area_mean + 20
data$points_se <- data$points_se - 0.04

pred.prop <- predict(model, newdata = data, 
                type = "response")      # response 해야 예측확률
pred <- ifelse(pred.prop >= 0.5, 1, 0)
pred
names(pred) <- NULL
pred


# 4. 앞서 만든 모델의 정확도를 구하십시오.
pred.prop <- predict(model, newdata = test, 
                     type = "response")
pred <- ifelse(pred.prop >= 0.5, 1, 0)
# confusion matrix(혼동행렬): 3개는 틀림
(cm <- table(pred = pred, actual = test$diagnosis))
(accuracy <- (cm[1,1] + cm[2,2]) / sum(cm))
