
# 대 제목

## 문서의 구조

### 2019.01.07
#### QQplot의 모습이 선형구조여야 한다. 끝에 튀어나와서 s자형태 안되는 듯

	(y와 y_hat)의 그래프  

%>%: dplyr 연산자  

```r
table(pred = test$pred1, real = test$raintomorrow)
pro <- prop.table(table(pred = test$pred1, real = test$raintomorrow))

## 정확도 정답: 0.9181818
accuracy <- pro[1,1] + pro[2,2]
accuracy

```
