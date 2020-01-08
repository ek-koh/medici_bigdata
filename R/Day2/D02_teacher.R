data(iris)
data(state)
class(iris)
class(state.x77)
str(state.x77)
dim(state.x77)
colnames(state.x77)
rownames(state.x77)

df <- data.frame(state.x77)
str(df)

str(iris)
mtx <- as.matrix(iris[, -5])
mtx
colnames(mtx)

aq <- read.csv("airquality.csv")
str(aq)
set.seed(3)
col <- sample(letters, 153, replace = T)
aq$NewCol <- col
str(aq)
write.csv(aq, "airquality2.csv", row.names = F)

aq2 <- read.csv("airquality2.csv", stringsAsFactors = F)
str(aq2)

aq3 <- read.csv("airquality3.csv", 
                stringsAsFactors = T, header = F)
str(aq3)
colnames(aq3) <- c("C1", "C2", "C3", "C4", "C5", "C6", "C7")
str(aq3)


iris$Label <- ifelse(iris$Petal.Length >= 5.1, "H", 
       ifelse(iris$Petal.Length > 1.6, "M", "L"))
str(iris)
unique(iris$Label)
iris$Label <- factor(iris$Label, levels = c("H", "M", "L"))
str(iris)
iris$Label <- factor(iris$Label, 
                     levels = c("L", "M", "H"), 
                     ordered = T)
str(iris)
apply(iris[, 1:4], 2, mean)


rowIndex <- which(iris$Petal.Length > 5)
iris[rowIndex, ]

data("mtcars")
str(mtcars)
head(mtcars)
rownames(mtcars)
colnames(mtcars)

apply(mtcars[,c("mpg", "hp", "wt")], 2, mean)

vec <- sample(letters[1:3], 100, replace = T)
table(vec)

length(vec)
vec[100]
vec[101] # NA
vec[101] <- "a"
vec
vec[50:52] <- NA
table(vec)
table(vec, useNA = "ifany")
prop.table(table(vec, useNA = "ifany"))

season <- c("spring", "summer", "fall", "winter")
set.seed(3)
favorite <- sample(season, 100, replace = T) 
favorite2 <- factor(favorite, levels = season)
table(favorite2)
barplot(table(favorite2), 
        col = c("red", "green", "blue", "gray"))

library(ggplot2)
library(dplyr)

data(mpg)
str(mpg)
mpg %>%
  ggplot(aes(x = class)) + 
  geom_bar()

barplot(table(mpg$class))
pie(table(mpg$class))

mean(mpg$cty)
mean(mpg$hwy)

apply(mpg[c("cty", "hwy")], 2, mean)

quantile(mpg$hwy, probs = 0:5/5)
0:5/5

boxplot(mpg$hwy)
mpg %>%
  ggplot(aes(x = class, y = hwy)) + 
  geom_boxplot()

(q <- quantile(mpg$hwy))
q1 <- q["25%"]
q3 <- q["75%"]
iqr <- q3 - q1
mpg$hwy
mpg$hwy > q3 + 1.5 * iqr
(outlier_idx1 <- which(mpg$hwy > q3 + 1.5 * iqr))
(outlier_idx2 <- which(mpg$hwy < q1 - 1.5 * iqr))
boxplot(mpg$hwy[-outlier_idx1])
quantile(mpg$hwy[-outlier_idx1])
quantile(mpg$hwy)

set.seed(123)
scores <- sample(seq(35, 100, 5), 
              1000, replace = T)
cut(scores, 
    breaks = c(0, 60, 70, 80, 90, 100), 
    include.lowest = T,
    right = F,
    labels = c("F", "D", "C", "B", "A"))

iris[1:4]
cor(iris$Sepal.Length, iris$Sepal.Width)
cor(iris$Sepal.Length, iris$Petal.Length)
cor(iris$Sepal.Length, iris$Petal.Width)

cor(iris[-(5:6)])[1, -1]
sort(abs(cor(iris[-(5:6)])[1, -1]), 
     decreasing = T)[1:2]

library(MASS)
data("birthwt")
str(birthwt)
(m <- birthwt[c("bwt", "age", "lwt", 
                "ptl", "ftv")])
(c <- cor(m)[1, -1])
sort(abs(c), decreasing = T)[1:2]


housing_df <- read.table("housing.data", sep = "", stringsAsFactors = F)
str(housing_df)
colnames(housing_df) <- c("CRIM","ZN","INDUS",
                          "CHAS","NOX","RM","AGE",
                          "DIS","RAD","TAX",
                          "PTRATIO","B","LSTAT",
                          "MEDV")
str(housing_df)
str(housing_df[-4])
cor(housing_df[-4])
cor(housing_df[-4])[, "MEDV"]
(c <- cor(housing_df[-4])[, "MEDV"])
c[-length(c)]
sort(abs(c[-length(c)]), decreasing = T)[1:5]


housing_df$GRP <- ifelse(housing_df$MEDV >= 25.0, "H",
                         ifelse(housing_df$MEDV >= 17.0, "M", "L"))
housing_df$GRP <- factor(housing_df$GRP,
                         levels = c("L", "M", "H"))
table(housing_df$GRP)

df <- housing_df[c("CRIM", "RM", "DIS", 
                   "TAX", "MEDV")]
str(df)
opar <- par(mfrow = c(2, 3))
for (i in 1:5) {
  hist(df[,i], main=colnames(df)[i])
}
par(opar)

opar <- par(mfrow = c(2, 3))
for (i in 1:5) {
  boxplot(df[,i], main=colnames(df)[i])
}
par(opar)

housing_df %>%
  ggplot(aes(x = GRP, y = CRIM)) +
  geom_boxplot()

housing_df %>%
  ggplot(aes(x = GRP, y = RM)) +
  geom_boxplot()

str(df)
pairs(df)

data <- c(1, 2, 3, NA, 5, NA, NA, 8)
is.na(data)
(na_idx <- which(is.na(data)))
data[-na_idx]
as.vector(na.omit(data))


x <- iris
x[1, 2] <- NA
x[1, 3] <- NA
x[2, 3] <- NA
x[3, 4] <- NA
idx <- which(apply(x, 1, function(row) {
  return(sum(is.na(row)))
}) >= 2)
x2 <- x[-idx, ]
x2
