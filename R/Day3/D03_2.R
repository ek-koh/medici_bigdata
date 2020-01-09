wine <- read.table("winequality-white.csv", sep = ';', header = T)
str(wine)
summary(wine)

# Q1. quality와의 상관계수를 구하고,
# 상관계수 상위 5개의 변수명을 구하십시오.
pairs(wine)
cor(wine)[12,-12]
sort(abs(cor(wine)[12,-12]), decreasing = T)[1:5]

cr.top5.names <- names(sort(abs(cor(wine)[12,-12]), decreasing = T)[1:5])


# Q2. 종속변수 quality와 1번 문제의 정답인 
# cr.top5.names변수로 구성된
# 회귀모델의 예측 값을 아래의 데이터를 이용해 구하십시오.
# 훈련데이터 80%, 검증데이터 20% 사용
# 랜덤 시드: 123

#"alcohol": 9.2
#"density": 0.9843
#"chlorides": 0.067
#"volatile.acidity": 0.45
#"total.sulfur.dioxide": 125

set.seed(123)
idx <- sample(1: nrow(wine), 0.8 * nrow(wine), replace = F)
train <- wine[idx,]
test <- wine[-idx,]


model <- lm(quality ~ alcohol + density + chlorides
            + volatile.acidity + total.sulfur.dioxide,
            data = train)
summary(model)
test$pred <- predict(model, newdata = test)
head(test[12:13])

new_df <- data.frame("alcohol" = 9.2, "density" = 0.9843,
                     "chlorides" = 0.067,
                     "volatile.acidity"= 0.45,
                     "total.sulfur.dioxide" = 125)
new_df
pred2 <- predict(model, newdata = new_df)
pred2

# cr.top5.names변수 이용하는 방법 : paste() 활용해서
# fm.top5.names 만들고
# lm(as.formula(fm.top5.names, data = ...))



# Q3. model.cr.top5(내가 쓴 변수명은 model)와
# 모든 변수를 가진 model.full과의
# RMSE 지표를 비교하십시오.
model.full <- lm(quality ~ ., data = train)
summary(model.full)
full_pred <- predict(model.full, newdata = test)
test$full_pred <- full_pred
head(test[12:14])


rmse <- function(yi, yi_hat) {
  return(sqrt(mean((yi - yi_hat)^2)))
}
rmse(test$quality, test$pred)
rmse(test$quality, test$full_pred)
# full이 더 좋음


library(MASS)
model.AIC <- stepAIC(model.full, scope = list(upper = ~.,
                                              lower = ~ 1))
summary(model.AIC)
test$pred_AIC <- predict(model.AIC, newdata = test)
rmse(test$quality, test$pred_AIC)


model.AIC2 <- stepAIC(model.full, scope = list(upper = ~.^2,
                                              lower = ~ 1))
# * 항 포함한 내용
summary(model.AIC2)
test$pred_AIC2 <- predict(model.AIC2, newdata = test)
rmse(test$quality, test$pred_AIC2)
