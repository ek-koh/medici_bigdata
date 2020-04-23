# Chapter 04
# 7
# (1)
str(iris)
apply(iris[,1:4], 1, sum)

# (2)


# 8
# (1)
str(mtcars)
head(mtcars)
apply(mtcars, 2, sum)

# (2)
apply(mtcars, 2, max)

# (3)
apply(mtcars, 2, sd)


# 9
lgm <- function(x,y) {
  min <- min(x,y)
  max <- max(x,y)
  remainder <- max %% min
  result <- ifelse(remainder == 0, min, lgm(min, remainder))
  return(result)
}

result1 <- lgm(10,8)
result1
result2 <- lgm(10,20)
result2


# 10
maxmin <- function(vec) {
  max_val <- max(vec)
  min_val <- min(vec)
  return(list(max=max_val, min=min_val))
}
v1 <- c(7,1,2,8,9)
result <- maxmin(v1)
result$max ; result$min

result <- maxmin(iris[,1])
result$max ; result$min

# 11
weight <- c(69, 50, 55, 71, 89, 64, 59, 70, 71, 80)
# (1)
which.max(weight)
# (2)
which.min(weight)
# (3)
which(weight > 61 & weight < 69)
# (4)


# 12
# (1)
str(iris)
maxIndex <- which.max(iris$Petal.Length)
iris[maxIndex,]

# (2)
Index <- which(iris$Petal.Width >= 0.3 & iris$Petal.Width <= 0.4)
iris[Index,]


# Chapter 05
# 5
# (1)
wt <- mtcars$wt
mean(wt)
median(wt)
mean(wt, trim = 0.15)
sd(wt)

# (2)
summary(wt)

# (3)
str(mtcars)
unique(mtcars$cyl)
mtcars$cyl <- as.factor(mtcars$cyl)
table(mtcars$cyl)

# (4)
barplot(table(mtcars$cyl))

# (5)
hist(mtcars$wt, breaks = 15)

# (6)
boxplot(mtcars$wt, horizontal = T)

q <- quantile(mtcars$wt)
Q1 <- q[2]
Q3 <- q[4]
IQR <- Q3 - Q1
outIdx <- which(mtcars$wt > Q3 + 1.5*IQR
                | mtcars$wt < Q1 - 1.5*IQR)
outlier <- mtcars$wt[outIdx]
summary(mtcars$wt)
outlier

# (7)
boxplot(mtcars$disp, horizontal = T)

q <- quantile(mtcars$disp)
Q1 <- q[2]
Q3 <- q[4]
IQR <- Q3 - Q1
outIdx <- which(mtcars$disp > Q3 + 1.5*IQR
                | mtcars$disp < Q1 - 1.5*IQR)
outlier <- mtcars$disp[outIdx]
summary(mtcars$disp)
outlier

#(8)
str(mtcars)
unique(mtcars$gear)
mtcars$gear <- factor(mtcars$gear, levels = c(3, 4, 5))
boxplot(mtcars$mpg ~ mtcars$gear)

# 6
# (1)
data(trees)
head(trees)

# (2)
G <- trees$Girth
mean(G)
median(G)
mean(G, trim = 0.15)
sd(G)

# (3)
hist(G)

# (4)
boxplot(G)

# (5)
h <- trees$Height
mean(h)
median(h)
mean(h, trim = 0.15)
sd(h)

# (6)
hist(h)

# (7)
boxplot(h)


# 7
# (1)
data("Orange")
head(Orange)

# (2)
age <- Orange$age
mean(age)
median(age)
mean(age, trim = 0.15)
sd(age)

# (3)
hist(age)

# (4)
str(Orange)
boxplot(age ~ Orange$Tree)

# (5)
str(Orange)
unique(Orange$Tree)
cir <- subset(Orange$circumference, Orange$Tree != 2)
mean(cir)
median(cir)
mean(cir, trim = 0.15)
sd(cir)


# (6)
hist(cir)

#(7)
boxplot(Orange$circumference ~ Orange$Tree)

# Chapter 6
# 12
# (1)
library(mlbench)
data("Glass")
myds <- Glass

# (2)
str(myds)
pairs(myds[-10])

# (3)
cor(myds[-10])

# (4)
point <- as.integer(myds$Type)
pairs(myds[-10], pch=point, col=point)

# 13
# (1)
library(mlbench)
data("Ionosphere")
myds <- Ionosphere[,3:12]

# (2)
(s <- sort(abs(cor(myds)), decreasing = T)[-(1:10)])
index <- which(cor(myds) == s[1] | cor(myds) == s[3])
index
cor(myds)
str(cor(myds))
class(cor(myds))
# v5, v7
v5 <- myds[3]
v7 <- myds[5]
plot(v5, v7)
cor(v5, v7)
# v9, v11
v9 <- myds[7]
v11 <- myds[9]
plot(v9, v11)
cor(v9, v11)

plot(myds$V9, myds$V11)


# 14
data(LakeHuron)
str(LakeHuron)
years <- 1875:1972
hlevel <- as.vector(LakeHuron)
plot(years, hlevel, type = 'l', col='blue',
     main='LakeHuron', ylab='수위')

# 6장 15번
data("AirPassengers")
str(AirPassengers)
window(AirPassengers, 1949, c(1949, 12))

month <- 1:12
ps_1949 <- window(AirPassengers, 1949, c(1949, 12))
ps_1955 <- window(AirPassengers, 1955, c(1955, 12))
ps_1960 <- window(AirPassengers, 1960, c(1960, 12))
plot(month, ps_1949, type = 'o', col = 'red', ylim = c(80, 650))
lines(month, ps_1955, type = 'o', col = 'blue')
lines(month, ps_1960, type = 'o', col = 'green')

# 16
data("USAccDeaths")
str(USAccDeaths)     
mon3 <- USAccDeaths[1:12]
mon5 <- USAccDeaths[25:36]
mon7 <- USAccDeaths[49:60]
month <- 1:12
plot(month, mon3, type = 'l', col='red', ylim = c(6000, 13000))
axis(side = 1, at = 1:12)
lines(month, mon5, type = 'l', col='blue', ylim = c(6000,13000))
lines(month, mon7, type = 'l', col='violet', ylim = c(6000,13000))



### 과제 해설
# 15
ts(data = rnorm(12, 200, 15), start = 2019, frequency = 12)
str(AirPassengers)
window()


# 7장 연습문제
# 1
# (1)
ds <- state.x77
ds[2,3] <- NA; ds[3,1] <- NA; ds[2,4] <- NA; ds[4,3] <- NA
head(ds)
na_count <- function(df) {
  return(sum(is.na(df)))
}
apply(ds, 2, na_count)

# (2)
idx_na <- which(is.na(ds))
idx_na
na_count <- function(r) {
  return(sum(is.na(r)))
}
row_na <- apply(ds, 1, na_count)
row_na
head(ds)

# (3)
count <- 0
for (i in 1:length(row_na)) {
  if (row_na[i] > 0) {
    count <- count + 1
  }
}
count

# (4)
idx <- which(is.na(ds))
idx
ds.new <- ds[-idx]
ds.new <- data.frame(ds.new)
str(ds.new)
ds.new.mat <- as.matrix(ds.new)
str(ds.new.mat)
matrix(ds.new, 50, 8)
str(matrix(ds.new, 50, 8))
as.vector(ds.new)
as.matrix(ds.new, 50, 8)
str(ds.new)
c <- 1:20
matrix(ds.new,4, 99)
df <- data.frame(matrix(ds.new,4, 99))
str(df)


# 2
# (1)
st <- data.frame(state.x77)
for (i in 1:8) {
  boxplot(st[i])
  title(colnames(st[i]))
}

# (2)
q <- quantile(st$Area)
q
q1 <- q[2]
q3 <- q[4]
iqr <- q3 - q1
