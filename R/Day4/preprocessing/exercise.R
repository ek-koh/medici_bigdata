br <- read.csv("birth_risk.csv", fileEncoding = "UTF-8",
               stringsAsFactors = F)
str(br)

unique(br$immature)
br$immature <- factor(br$immature, levels = c("37주미만", "37주이상"))
unique(br$plural)
br$plural <- factor(br$plural, levels = c("한명", "쌍둥이", "세쌍둥이이상"))

boxplot(br$weight)
q <- quantile(br$weight)
q
q1 <- q[2]
q3 <- q[4]
iqr <- q3 - q1

idx <- which(br$weight > q3 + 1.5 * iqr |
               br$weight < q1 - 1.5 * iqr)
idx
length(idx)

# subset 쓰는 이 방법 틀림
outlier_idx <- which(subset(br, weight > q3 + 1.5 * iqr |
                              weight < q1 - 1.5 * iqr) == T)
length(outlier_idx)

br2 <- br
br2$weight[idx] <- mean(br$weight)
mean(br$weight)
summary(br$weight)
summary(br2$weight)
boxplot(br2$weight)
# 답안
br3 <- br
br3$weight[outlier_idx] <- mean(br$weight)
boxplot(br3$weight)

br2 <- br
br2$weight[outlier_idx] <- NA
sum(complete.cases(br2))
br2 <- br2[-outlier_idx,]
boxplot(br2$weight)

br3 <- br
br3$weight[idx] <- NA
sum(complete.cases(br3))

br3 <- br3[-idx,]
boxplot(br3$weight)
summary(br3$weight)

br2$weight <- 
ifelse(is.na(br2$weight), mean(br2$weight, na.rm = T),
      br2$weight)
boxplot(br2$weight)

pop <- read.csv("pop.csv", fileEncoding = "UTF-8",
                stringsAsFactors = F)
str(pop)

# age -> age.grp 10, 20, 30, .... 60대 이상

str(pop$AGE)
summary(pop$AGE)
na_idx <- which(is.na(pop$AGE))
pop$AGE[na_idx] <- mean(pop$AGE)
# 나이 -128 제거하기
pop <- subset(pop, AGE >= 0)
summary(pop$AGE)

pop$age.grp <- cut(pop$AGE, breaks = c(20, 30, 40, 50, 100),
               include.lowest = T,
               right = F,
               labels = c("20대", "30대", "40대", "50대 이상"))
table(pop$age.grp)


# income의 75% 이상의 경우 high_income에 1, 아니면 0
q3 <- quantile(pop$INCOME)[4]
pop$high_income <- ifelse(pop$INCOME >= q3, 1, 0)
table(pop$high_income)
prop.table(table(pop$high_income))

summary(pop$INCOME)
