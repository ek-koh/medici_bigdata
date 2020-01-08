# 데이터 분리와 선택 (p.262)
# split함수
class(split(iris, iris$Species))
sp <- split(iris, iris$Species)
str(sp)
class(sp$setosa)


# sample
# 머신러닝할 때 (학습데이터, 검증데이터) (평가데이터)
# 로 나누는 것과 관련됨
str(iris)
idx <- sample(1:nrow(iris), 50, replace = F)
str(idx)
train <- iris[-idx,]
test <- iris[idx,]

set.seed(123)
idx <- sample(1:nrow(iris), nrow(iris) * 0.7, replace = F)
str(idx)
train <- iris[idx,]
test <- iris[-idx,]

# 조합
combn(1:5, 3)

# 집계함수 (p.272)
# aggregate에서 기준이 되는 by 부분은 꼭 리스트 형태로 해야 함
x <- data.frame(name = c("a", "b", "c"), math = c(90, 80, 40))
y <- data.frame(name = c("a", "b", "d"), korean = c(75, 60, 90))
z <- merge(x, y, by = c("name"))
z
z1 <- merge(x, y, all.x = T)
z1
z2 <- merge(x, y, all.y = T)
z2
z3 <- merge(x, y, all = T)
z3

# 새로운 자료: 데이터 취득과 데이터 가공: SQL과 dplyr
library(dplyr)
install.packages("gapminder")
library(gapminder)
str(gapminder)    # 엄밀히 말하면 연도도 범주

gapminder %>%
  filter(grepl("korea, R", country, ignore.case = T)) %>%
  mutate(total_gdp = pop * gdpPercap) %>%
  select(-continent)

gapminder2 <- 
  gapminder %>%
    mutate(total_gdp = pop*gdpPercap)
head(gapminder2)

gapminder2 %>%
  filter(year == 2007) %>%
  select(country, pop, gdpPercap, total_gdp) %>%
  arrange(desc(total_gdp))

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(median_life_exp = median(lifeExp)) %>%
  arrange(desc(median_life_exp))

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(median_life_exp = median(lifeExp)) %>%
  arrange(-median_life_exp)


# 회귀분석
head(cars)
str(cars)
lm.model <- lm(dist ~ speed, data = cars)
coef(lm.model)

set.seed(123)
idx <- sample(1:nrow(cars), nrow(cars)*0.7, replace = F)
train <- cars[idx,]
test <- cars[-idx,]

lm.model <- lm(dist ~ speed, data = train)
coef(lm.model)

pred <- predict(lm.model, newdata = test)
head(pred)
str(pred)
str(test)
test$pred <- pred
test

mse <- function(df) {
  return(sum((df$actual - df$pred)^2)/nrow(df))
}       # 원래 n-(회귀계수의 수)로 나누는데 (ex. n-2 in 단순선형회귀)
# 그냥 n으로 나눠도 차이 거의 없음
result <- test[2:3]
names(result)
names(result)[1] <- "actual"
mse(result)


plot(dist ~ speed, data = cars)
lm.model
abline(lm.model, col = 'red')

# formula 형태 만들기
cols <- c("X1", "X2", "x3")
paste(cols, collapse = " + ")
paste("Y", 
      paste(cols, collapse = " + "),
      sep = " ~ ")
as.formula(paste("Y", 
                 paste(cols, collapse = " + "),
                 sep = " ~ "))


install.packages("car")
library(car)
data("Prestige")
str(Prestige)

set.seed(123)
idx <- sample(1: nrow(Prestige), 0.8*nrow(Prestige), replace = F)

train <- Prestige[idx,]
test <- Prestige[-idx,]

model.full <- lm(income ~ ., data = train)
model.4 <- lm(income ~ education + women + prestige + census, data = train)
test$pred.full <- predict(model.full, newdata = test)
test$pred.4 <- predict(model.4, newdata = test)

summary(model.full)
summary(model.4)
library(MASS)
model.aic <- stepAIC(model.4)
summary(model.aic)

mse <- function(yi, yi_hat) {
  return(mean((yi-yi_hat)^2))
}
head(test)
sqrt(mse(test$income, test$pred.full))
sqrt(mse(test$income, test$pred.4))


model.3 <- lm(income ~ education + women + prestige, data = train)
summary(model.3)
test$pred.3 <- predict(model.3, newdata = test)
sqrt(mse(test$income, test$pred.3))
# 설명력은 줄어들었지만 MSE가 줄어들었으므로 의미 있는 시도.

model.2 <- lm(income ~ women + prestige, data = train)
summary(model.2)
test$pred.2 <- predict(model.2, newdata = test)
sqrt(mse(test$income, test$pred.2))
# best point를 찾아가는 과정이었음.
# 내가 가진 모델이 전체 데이터를 다 설명할 필요는 없음
# 보통 60% 이상이면 괜찮다고 봄
# 결정계수는 통계지표이기 때문에 머신러닝에서는 안씀(AIC도)
# 모델 자체에 대한 성능평가는 SSE 기반으로 한 MSE를 봐야 함.
# 즉, 예측의 정확도를 따지는 데에 있어서는 MSE
# 물론 통계에서는 R-square 사용함

