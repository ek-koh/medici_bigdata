2+3
print(2+10)

a = 10
b <- 20
c <- F
d <- TRUE
e <- 'abc'
data(iris)
iris

typeof(iris)
typeof(a)
typeof(c)
typeof(d)
typeof(e)

typeof(as.integer(a))

class(iris)
typeof(iris)
class(a)
class(b)
class(c)
class(d)
class(e)

sqrt(-3)
type(NaN)
typeof(NaN)
class(NaN)
typeof(NA)
class(NA)
typeof(NULL)
class(NULL)
i = Inf
i
typeof(i)
typeof(-i)
class(i)
remove(i)

a <- "A"
a+b
a + as.character(b)
as.character(b)

b <- "B"
a+b

a <- c(1, 2, 3, 4, 5)
a[0]
print(a[0])
a[1]

a <- 1:5
a <- c(1:5)
class(a)
typeof(a)
b = 10
typeof(b)

a <- c(1, 2, 3, 4, 5)
class(a)
typeof(a)
as.integer(a)
class(a)
typeof(a)
a <- as.integer(a)
typeof(a)

scores <- c(90, 88, 99, 100, 100, 92)
length(scores)
scores[0]
scores[5]
scores[6]
scores[length(scores)]

# 원소에 이름 주기
names(scores)
names(scores) <- c("A", "B", "C", "D", "E", "F")
scores
scores[D]
scores["D"]

# 동일한 데이터타입이 아닌 케이스
arr_1d <- c(1, 2, 3.14)       #numeric, double
arr_1d <- c(1, 2, "3")        #character, character
arr_1d <- c(1, 0, F)          #numeric, double
typeof(arr_1d)
rm(arr_1d)

# 하나의 변수 제거하기
# rm(~~)
# environment창 클리어하기기
rm(list = ls())

# seq 함수
arr <- 1:100
arr2 <- seq(1, 100, 1)
arr2 <- as.integer(seq(1, 100, 1))

# rep 함수 - 반복
(arr3 <- rep(1:3, 3))
arr4 <- rep(1:3, 3, each = 2)

scores <- c(90, 95, 100)
names(scores) <- c("국어", "영어", "수학")
scores
names(scores)[2] <- c("ENG")
scores
scores[3]
scores[4]
scores[1:-1]
scores[-1]
scores[-1:3]


# 랜덤샘플링
letters
LETTERS
(vec1 <- sample(letters, 5, replace = TRUE))
(vec1 <- sample(letters, 5, replace = F))
(lotto <- sample(1:45, 6))

vec3 <- rnorm(1000000, 68, 5)
(q <- quantile(vec3))
q["25%"]
q["75%"]
q[4]

letters[c(1,3)]


# 벡터의 연산
v1 <- 1:3
v2 <- 2
v3 <- v1 + v2
v4 <- 1:3
v5 <- c(1, 2)
v6 <- v4 + v5

# range, length
# range는 min과 max 정보를 나타냄
length(v6)
vec3 <- rnorm(1000000, 68, 5)
range(vec3)
sort(v6)
sort(v6, decreasing = T)


# seed
# 현재시각을 씀.
# 꼭 seed행이랑 밑에 행이랑 블럭처리해서 한 번에 실행
# seed를 이용하여 난수를 이용하기 때문에 같은 seed를 썼다면
# 난수를 만들더라도 누가 하던 언제 하던 똑같은 결과 나옴
set.seed(123)
vec <- sample(letters, 200, replace = T)

# logical indexing: 조건을 만족하는 데이터를 찾아낼 때
vec >= "s"
vec_s <- vec[vec >= "s"]
which(vec >= "s")         # 조건을 만족하는 데이터의 위치
vec2 <- c(T, F, T, T, F, F)
sum(vec2)                  # TRUE인 것의 개수 알 수 있음

# 리스트
myinfo <- list(name = "Tom", age = 30, 
               status = T, score = c(90, 85, 70, 84))
myinfo
myinfo$name
myinfo[[1]]
myinfo[1]

myinfo$score[4]
myinfo[[4]][4]

# factor: 범주형 변수 인코딩(연속형 형태로)할 때 처리 쉽게 함
set.seed(123)
bt <- sample(c("A", "B", "AB", "O"), 100, replace = T)
bt
bloodtype <- as.factor(bt)
sort(unique(bt))
typeof(bloodtype)
class(bloodtype)
bloodtype[1]
as.integer(bloodtype[1])

# factor를 수동으로 생성하기
(bloodtype2 <- factor(bt, levels = c("A", "B", "AB", "O")))
bloodtype2[1]
as.integer(bloodtype2[1])
bloodtype2[1] <- "A"
bloodtype2
bloodtype2[1] <- "C"
bt[1] <- "C"
bt[1]
levels(bloodtype2) <- c("A", "AB", "B", "O")
levels(bloodtype2)
bloodtype2[1] <- "A"

# matrix
mat1 <- matrix(1:20, nrow = 4)
mat1
mat2 <- matrix(1:20, nrow = 4, byrow = T)
mat2
dim(mat1)
dim(mat1) <- c(5, 4)
mat1
dim(mat1) <- NULL
mat1

# matrix indexing
dim(mat1) <- c(4, 5)
mat1
mat1[2,2]
mat1[,3]
mat1[1, 2:4]
mat1[-2,]

# 이름붙이기
colnames(mat1) <- c("C1", "C2", "C3", "C4", "C5")
rownames(mat1) <- c("R1", "R2", "R3", "R4")
mat1
mat1[2,2]
mat1["R2", "C2"]
mat1["R2", "C2":"C5"]    # numeric이 아니라 사용할 수 없음
mat1["R2", 2:5]
mat1["R2", c("C2", "C3", "C4", "C5")]

# rbind, cbind
x <- 1:4
y <- 5:8
r <- rbind(x,y)
cbind(x,y)
rbind(r,x)

# 데이터프레임: 주의) 데이터프레임은 모든 문자를 factor로 바꿈
city <- c("Seoul", "Tokyo", "Washington")
rank <- c(1, 2, 3)
city.info <- data.frame(city, rank)
city.info
str(city.info)

# factor로 자동변환 하기 싫다면?
city.info <- data.frame(city, rank, stringsAsFactors = F)
str(city.info)
city.info$city <- as.factor(city.info$city)
city.info$city

# dataframe다루기
str(iris)
levels(iris$Species)
dim(iris)
dim(iris)[2]
ncol(iris)
colnames(iris)[5] <- "species"
head(iris, 3)
tail(iris, 4)

# 집계표(빈도표)
table(iris[,"species"])

# 행별, 열별 합계와 평균 (p.113)
colSums(iris[,-5])
colMeans(iris[,-5])

mat1
t(mat1)

# 예제
c1 <- rnorm(1000000, 250, 10)
c2 <- rnorm(1000000, 160, 5)
df <- data.frame(c1, c2)
str(df)
df2 <- subset(df, c1 < 240 & c2 > 170)
head(df2)
df[150,]
typeof(rownames(df2))
(idx <- as.integer(rownames(df2)))
range(df[-idx, "c1"])

hist(c1, col = "red")
hist(c2, col = "blue")

