library1 <- c("plyr", "ggplot2", "stringr", "zoo", "corrplot", "RColorBrewer")
unlist(lapply(library1, require, character.only=TRUE))
install.packages("corrplot")
install.packages("zoo")

product <- read.csv("product.csv", header = T, fileEncoding = "UTF-8")
weather <- read.csv("weather.csv", header = T, fileEncoding = "EUC-KR")
code <- read.csv("code.csv", header = T)

head(product)
head(weather)
head(code)

colnames(product) <- c('date', 'category', 'item', 'region', 'mart', 'price')

category <- subset(code, code$구분코드설명 == "품목코드")
category

colnames(category) <- c('code', 'exp', 'item', 'name')

head(product)
category

total.pig <- product[which(product$item == 514),]
head(total.pig, 10)

region <- subset(code, code$구분코드설명=='지역코드')
region

colnames(region) <- c('code', 'exp', 'region', 'name')
region
head(total.pig)

day.pig <- merge(total.pig, region, by = 'region', all = T)
head(day.pig, 10)

# ddply() 이해를 위한 예제
x <- data.frame(
  Date=as.Date(c('2013-10-01', '2013-10-02', '2013-10-02', '2013-10-02', '2013-10-01', '2013-10-02', '2013-10-02')),
  Category=factor(c('First', 'First', 'First', 'Second', 'Third', 'Third', 'Second')),
  Frequency=c(10,15,5,2,14,20,3))

head(x)

ddply(x, .(Date, Category), summarize, Sum_F=sum(Frequency))

# dlply() 이해를 위한 예제
x <- data.frame(
  Date=as.Date(c('2013-10-01', '2013-10-02', '2013-10-02', '2013-10-02', '2013-10-01', '2013-10-02', '2013-10-02')),
  Category=factor(c('First', 'First', 'First', 'Second', 'Third', 'Third', 'Second')),
  Frequency=c(10,15,5,2,14,20,3))

dlply(x, .(Date), summarize, Sum_F=sum(Frequency))

# day.pig 데이터를 일별로 정렬한 후,
# 지역별로 돼지고기의 평균가격을 구하여 생성한 데이터프레임을
# 지역별 이름으로 나누어 total.pig.mean이라는 리스트 형태의 데이터 생성
head(day.pig)

p1 <- ddply(day.pig, .(date), summarise, name=name, region=region, price=price)
p2 <- ddply(p1, .(date, name), summarise, mean.price = mean(price))
p2
total.pig.mean <- dlply(p2, .(name))
## total.pig.mean <- dlply(ddply(ddply(day.pig, .(date), summarise, name=name, region=region, price=price), .(date, name), summarise, mean.price=mean(price)), .(name))

# 각 지역별 데이터의 크기 확인하기
for (i in 1:length(total.pig.mean)) {
  cat(names(total.pig.mean)[i],"의 데이터의 길이는", 
      nrow(total.pig.mean[[i]]),"이다\n")
}

head(day.pig)
day.pig <- day.pig[!day.pig$name %in% c("의정부", "용인", "창원", "안동", "포항", "순천", "춘천"),]

# day.pig 데이터를 지역(region), 일자(date)별로 돼지고기 평균가격 구하여
# pig.region.daily.mean 데이터를 생성한다.

pig.region.daily.mean <- ddply(day.pig, .(name, region, date), summarise, mean.price = mean(price))
head(pig.region.daily.mean, n=10)

pig.region.monthly.mean <- ddply(pig.region.daily.mean,
    .(name, region, month=str_sub(pig.region.daily.mean$date,1,7)),
    summarise, mean.price=mean(mean.price))
head(pig.region.monthly.mean, 10)

pig.region.yearly.mean <- ddply(pig.region.daily.mean,
  .(name, region, year=str_sub(pig.region.daily.mean$date,1,4)),
  summarise, mean.price=mean(mean.price))
head(pig.region.yearly.mean, 10)

# 상관분석 및 데이터 시각화
