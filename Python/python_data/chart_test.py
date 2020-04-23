# import matplotlib.pyplot as plt
#
# plt.rc('font', family = 'Malgun Gothic')
# plt.title("그래프 제목")
# plt.plot([10, 20, 30, 40, 50], [10, 10, 30, 30, 40], color='red', label='data1', linestyle=':')
# plt.plot([10, 10, 30, 30, 40], [10, 20, 30, 40, 50], color='green', label='data2', ls='--')
# plt.legend()
#
# plt.show()


### 서울시 최고, 최저기온 그래프 (p. 42)
# import matplotlib.pyplot as plt
# import csv
#
# f = open('기후데이터.csv', 'r', encoding='CP949')
# data = csv.reader(f, delimiter=',')
# header = next(data)
#
# max_result = []
# min_result = []
# for row in data:
#     if len(row) < 7 or row[4] == '' or row[6] == '':
#         continue
#
#     max_result.append(float(row[4]))
#     min_result.append(float(row[6]))
#
#
# plt.rc('font', family='Malgun Gothic')
# plt.title('서울시 최고기온')
# plt.plot(max_result, 'r', label='최고기온')
# plt.plot(min_result, 'b', label='최저기온')
# plt.legend()
# plt.show()
#
# f.close()


#### 8월 기온변화 그래프 만들기 (p. 44)
# import matplotlib.pyplot as plt
# import csv
#
# f = open('기후데이터.csv', 'r', encoding='CP949')
# data = csv.reader(f, delimiter=',')
#
# header = next(data)
#
# result = []
#
# for row in data:
#     if len(row) < 7 or row[4] == '':
#         continue
#
#     if row[2][5:7] == '08':
#         result.append(float(row[4]))
#
# plt.rc('font', family='Malgun Gothic')
# plt.title('8월 최고기온')
# plt.plot(result, 'r')
# plt.show()
#
# f.close()


#### 내 생일의 기온 변화 그래프 만들기 (p.47)

# import matplotlib.pyplot as plt
# import csv
#
# f = open('기후데이터.csv', encoding='CP949')
# data = csv.reader(f, delimiter=',')
#
# header = next(data)
#
# result = []
# month = input("태어난 월을 입력하세요: ")
# day = input("태어난 일을 입력하세요: ")
# for row in data:
#     if len(row) < 7 or row[4] == '':
#         continue
#     date = row[2].split('-')
#
#     if len(date) == 3 and date[1] == month and date[2] == day:
#         result.append(float(row[4]))
#
# plt.rc('font', family='Malgun Gothinc')
# plt.title("내 생일의 기온 변화")
# plt.plot(result, 'purple')
# plt.show()
#
# f.close()

#### 히스토그램 (p. 56)
# import matplotlib.pyplot as plt
#
# plt.hist([1, 1, 2, 3, 4, 5, 5, 7, 10])
# plt.show()


#### 최고기온 히스토그램(p. 57)
# import csv
# import matplotlib.pyplot as plt
#
# f = open('기후데이터.csv', 'r', encoding='CP949')
# data = csv.reader(f, delimiter=',')
#
# header = next(data)
# result = []
# for row in data:
#     if len(row) < 5 or row[4] == '':
#         continue
#     result.append(float(row[4]))
#
# plt.hist(result, bins=200)
# plt.show()
#
# f.close


#### 1월 & 8월 최고기온 히스토그램
# import csv
# import matplotlib.pyplot as plt
#
# f = open('기후데이터.csv', 'r')
# data = csv.reader(f, delimiter=',')
#
# header = next(data)
# aug = []
# jan = []
#
# for row in data:
#     if len(row) < 5 or row[4] == '':
#         continue
#
#     date = row[2].split('-')
#     if len(date) == 3 and date[1] == '08':
#         aug.append(float(row[4]))
#     if len(date) == 3 and date[1] == '01':
#         jan.append(float(row[4]))
#
# plt.rc('font', family='Malgun Gothic')
# plt.hist(aug, bins=100, color='r', label='08월')
# plt.hist(jan, bins=100, color='b', label='01월')
# plt.legend()
# plt.show()
#
# f.close()


#### 월을 입력받아 히스토그램 (p. 62)
# import csv
# import matplotlib.pyplot as plt
#
# f = open('기후데이터.csv', 'r')
# data = csv.reader(f, delimiter=',')
#
# header = next(data)
# month = input('월을 입력하세요 (ex. 9월이면 09): ')
# temp_max = []
#
# for row in data:
#     if len(row) < 5 or row[4] == '':
#         continue
#
#     date = row[2].split('-')
#     if len(date) == 3 and date[1] == month:
#         temp_max.append(float(row[4]))
#
#
# plt.rc('font', family='Malgun Gothic')
# plt.hist(temp_max, bins=100, color='r')
# plt.show()
#
# f.close()


#### 인구 공공데이터 읽어오기 (p. 71)
# import csv
#
# f = open('인구공공데이터.csv', 'r')
# data = csv.reader(f)
#
# header = next(data)
#
# for row in data:
#     print(row)
#
# f.close()

#### 인구 구조 시각화 (p.73)
# import csv
# import matplotlib.pyplot as plt
#
# f = open('인구공공데이터.csv', 'r')
# data = csv.reader(f)
#
# result = []
# for row in data:
#     if '신도림' in row[0]:
#         for i in row[3:24]:
#             result.append(int(i.replace(',', '')))
#
# x = [str(i*5)+'세' for i in range(len(result))]
# plt.rc('font', family = 'Malgun Gothic')
# # plt.title("신도림동 인구조사")
# plt.plot(result)
# plt.xticks([i for i in range(len(result))], x)
# plt.show()

#### 동을 입력받아 인구 구조 그래프 만들기 (p.75)
# import csv
# import matplotlib.pyplot as plt
#
# f = open('인구공공데이터.csv', 'r')
# data = csv.reader(f)
# header = next(data)
#
# dong = input('동을 입력하세요:')
# result = []
# for row in data:
#     if dong in row[0]:
#         for i in row[3:24]:
#             result.append(int(i.replace(',', '')))
#
# x = [str(i*5)+'세' for i in range(len(result))]
# plt.rc('font', family='Gulim')
# plt.title(dong+' 인구조사')
# plt.plot(result)
# plt.xticks([i for i in range(len(result))], x)
# plt.show()
#
# f.close()


#### 인구 구조 시각화 - 막대그래프 (p.78)
# import csv
# import matplotlib.pyplot as plt
#
# f = open('인구공공데이터.csv', 'r')
# data = csv.reader(f)
#
# result = []
# for row in data:
#     if '신도림' in row[0]:
#         for i in row[3:24]:
#             result.append(int(i.replace(',', '')))
#
# x = [str(i*5)+'세' for i in range(len(result))]
# plt.rc('font', family='Gulim')
# plt.title('신도림동 인구조사')
# plt.bar(range(len(result)), result)
# plt.xticks([i for i in range(len(result))], x)
# plt.show()
#
# f.close()


#### 인구 구조 시각화 - barh 함수 사용 (p.81)
# import csv
# import matplotlib.pyplot as plt
#
# f = open('인구공공데이터.csv', 'r')
# data = csv.reader(f)
#
# result = []
# for row in data:
#     if '신도림' in row[0]:
#         for i in row[3:24]:
#             result.append(int(i.replace(',', '')))
#
# y = [str(i*5)+'세' for i in range(len(result))]
# plt.rc('font', family='Malgun Gothic')
# plt.title('신도림동 인구 조사')
# plt.barh(range(len(result)), result)
# plt.yticks([i for i in range(len(result))], y)
# plt.show()


#### 성별 인구 구조 시각화 (p.89)
# import csv
# import matplotlib.pyplot as plt
#
# f = open('인구공공데이터_성별.csv', 'r')
# data = csv.reader(f)
#
# m = []
# f = []
#
# for row in data:
#     if '전국' in row[0]:
#         for i in range(0, 101):
#             m.append(int(row[i+3].replace(',', '')))
#             f.append(int(row[-(i+1)].replace(',', '')))
# f.reverse()
#
# plt.rc('font', family='Malgun Gothic')
# plt.barh(range(101), m, label='남성')
# plt.barh(range(101), f, label='여성')
# plt.legend()
# plt.show()


#### 성별 인구 구조 시각화 - 항아리 그래프 (p.92)
# import csv
# import matplotlib.pyplot as plt
#
# f = open('인구공공데이터_성별.csv', 'r')
# data = csv.reader(f)
#
# m = []
# f = []
#
# for row in data:
#     if '전국' in row[0]:
#         for i in range(101):
#             m.append(int(row[i+3].replace(',', '')))
#             f.append(-int(row[-(1+i)].replace(',', '')))
# f.reverse()
#
# plt.rc('font', family='Malgun Gothic')
# plt.barh(range(101), m, label='남성')
# plt.barh(range(101), f, label='여성')
# plt.legend()
# plt.show()

#### 동을 입력받아 성별 인구 구조 시각화하기 (p.95)
# import csv
# import matplotlib.pyplot as plt
#
# f = open('인구공공데이터.csv', 'r')
# data = csv.reader(f)
#
# m = []
# f = []
# dong = input('동을 입력하세요:')
#
# for row in data:
#     if dong in row[0]:
#         for i in range(21):
#             m.append(int(row[i+26].replace(',', '')))
#             f.append(-int(row[-(1+i)].replace(',', '')))
# f.reverse()
#
# plt.rc('font', family='Gulim')
# plt.title(dong+' 성별 인구구조')
# plt.barh(range(21), m, label='남성')
# plt.barh(range(21), f, label='여성')
# plt.legend()
# plt.show()

#### 파이 차트 (p.98)
# import matplotlib.pyplot as plt
#
# plt.pie([10, 20])
# plt.show()

#### 파이 차트에 레이블 추가해보기 (p. 99)
# import matplotlib.pyplot as plt
#
# plt.rc('font', family='Malgun Gothic')
# size = [2441, 2312, 1031, 1233]
# label = ["A형", "B형", "AB형", "O형"]
# plt.pie(size, labels=label, autopct="%.1f%%")
# plt.show()


####  성별 인구 구조 시각화 - 파이 차트로 만들기 (p.102)
# import csv
# import matplotlib.pyplot as plt
#
# f = open('인구공공데이터_성별.csv')
# data = csv.reader(f)
#
# input_data = input('지역을 입력하세요 (ex. 제주특별자치도)')
# m = []
# f = []
#
# for row in data:
#     if input_data in row[0]:
#         for i in range(101):
#             m.append(int(row[i+3].replace(',', '')))
#             f.append(int(row[-(1+i)].replace(',', '')))
# f.reverse()
#
# plt.rc('font', family='Malgun Gothic')
# plt.title(input_data+' 지역의 남녀 성별 비율')
# color = ['blue', 'red']
# plt.pie([sum(m), sum(f)],
#         labels=['남', '여'],
#         colors=color,
#         autopct='%.1f%%',
#         startangle=90)
# plt.show()


#### 대중교통 데이터 확인 (p.111)
# import csv
#
# f = open('대중교통데이터.csv', 'r')
# data = csv.reader(f)
#
# for row in data:
#     print(row)
#
# f.close()

#### 유임승차 비율이 높은 역 찾기 (p.113)
# import csv
#
# def convert_int(s):
#     return int(s.replace(',', ''))
#
# f = open('대중교통데이터.csv', 'r')
# data = csv.reader(f)
#
# next(data)
# max_rate = 0
# max_row = []
#
# for row in data:
#     rate = convert_int(row[4])/(convert_int(row[4]) + convert_int(row[6]))
#     if rate > max_rate:
#          max_rate = rate
#          max_row = row
#
# print("유임승차 비율이 가장 높은 역은:", max_row[3], max_rate)
# f.close()

######## 지축 1.0 나옴

# 무임승차 0인 역 찾기 (p.115)
# import csv
#
# def convert_int(s):
#     return int(s.replace(',', ''))
#
# f = open('대중교통데이터.csv', 'r')
# data = csv.reader(f)
#
# next(data)
# for row in data:
#     if row[6] == '0':
#         print(row[3])
#
# f.close()

#### 유임 승차 비율이 높은 역 찾기 - 0으로 나뉘는 경우 제외 (p.118)
# import csv
#
# def convert_int(s):
#     return int(s.replace(',', ''))
#
# f = open('대중교통데이터.csv', 'r')
# data = csv.reader(f)
#
# next(data)
# max_rate = 0
# max_row = []
#
# for row in data:
#     if row[6] != '0':
#         rate = convert_int(row[4])/(convert_int(row[4]) + convert_int(row[6]))
#         if rate > max_rate:
#             max_rate = rate
#             max_row = row
#
# print("유임승차 비율이 가장 높은 역은:", max_row[3], max_rate)
# f.close()



#### 최소 승차인원이 100,000명 이상일 경우만 찾아보기 (p.120)
# import csv
#
# def convert_int(s):
#     return int(s.replace(',', ''))
#
# f = open('대중교통데이터.csv', 'r')
# data = csv.reader(f)
#
# next(data)
# max_rate = 0
# max_row = []
#
# for row in data:
#     total = convert_int(row[4]) + convert_int(row[6])
#     if total >= 100000:
#         rate = convert_int(row[4])/total
#         if rate > max_rate:
#             max_rate = rate
#             max_row = row
#
# print("유임승차 비율이 가장 높은 역은:", max_row[3], max_rate)
# f.close()

#### 실습: 유임 승차 비율 0.92 이상을 출력해보고 이유를 추측해보기(p.121)
# import csv
#
# f = open('대중교통데이터.csv', 'r')
# data = csv.reader(f)
#
# next(data)
#
# for row in data:
#     total = int(row[4].replace(',', '')) + int(row[6].replace(',', ''))
#     if row[6] != '0' and total >= 100000:
#         rate = int(row[4].replace(',', '')) / total
#         if rate >= 0.94:
#             print(row[3], rate)
# f.close()


#### 파이 차트로 만들어보기 (p.123)
# import csv
# import matplotlib.pyplot as plt
#
# def convert_int(s):
#     return int(s.replace(',', ''))
#
# f = open('대중교통데이터.csv', 'r')
# data = csv.reader(f)
# next(data)
# max_rate = 0
# max_row = []
#
# for row in data:
#     total = convert_int(row[4]) + convert_int(row[6])
#     if row[6] != '0' and total >= 100000:
#         rate = convert_int(row[4]) / total
#         if max_rate < rate:
#             max_rate = rate
#             max_row = row
#
# label = ['유임승차', '유임하차', '무임승차', '무임하차']
# plt.rc('font', family='Malgun Gothic')
# plt.title(max_row[3]+''+max_row[1])
# plt.pie([convert_int(max_row[4]),
#          convert_int(max_row[5]),
#          convert_int(max_row[6]),
#          convert_int(max_row[7])],
#         labels=label, autopct='%1.f%%')
# plt.show()

# f.close()

#### 차트를 이미지로 저장해보기 (p.127)
# import csv
# import matplotlib.pyplot as plt
#
# def convert_int(s):
#     return int(s.replace(',', ''))
#
# f = open('대중교통데이터.csv', 'r')
# data = csv.reader(f)
# next(data)
# max_rate = 0
# max_row = []
#
# for row in data:
#     total = convert_int(row[4]) + convert_int(row[6])
#     if row[6] != '0' and total >= 100000:
#         rate = convert_int(row[4]) / total
#         if max_rate < rate:
#             max_rate = rate
#             max_row = row
#
# label = ['유임승차', '유임하차', '무임승차', '무임하차']
# plt.rc('font', family='Malgun Gothic')
# plt.title(max_row[3] + '' + max_row[1])
# plt.pie([convert_int(max_row[4]),
#          convert_int(max_row[5]),
#          convert_int(max_row[6]),
#          convert_int(max_row[7])],
#         labels=label, autopct='%1.f%%')
# plt.savefig(max_row[3] + '' + max_row[1] + '.png')
# plt.show()
#
# f.close()


#### 시간대별 승차 비율 찾기 (p.128)
# import csv
#
# def convert_int(s):
#     return int(s.replace(',', ''))
#
# f = open("대중교통데이터2.csv", "r")
# data = csv.reader(f)
# next(data)
# next(data)
#
# max_row = []
# max_count = 0
#
# for row in data:
#     count = convert_int(row[12])
#     if count > max_count:
#         max_count = count
#         max_row = row
#
# print(max_row[3], max_count)
#
# f.close()

#### 출근시간대(07:00~10:00)까지 하차인원 많은 역
# import csv
#
# f = open("대중교통데이터2.csv", 'r')
# data = csv.reader(f)
#
# next(data)
# next(data)
#
# def convert_int(s):
#     return int(s.replace(',', ''))
#
# max_row = []
# max_count = 0
#
# for row in data:
#     row[4:-1] = map(convert_int, row[4:-1])
#     count = sum(row[11:18:2])
#     if max_count < count:
#         max_count = count
#         max_row = row
#
# print(max_row[3], max_count)
#
# f.close()

#### 밤 11시에 승차하는 인원이 많은 역은? (p.134)
# import csv
#
# f = open("대중교통데이터2.csv", 'r')
# data = csv.reader(f)
# next(data)
# next(data)
#
# def convert_int(s):
#     return int(s.replace(',', ''))
#
#
# max_count = 0
# max_row = []
#
# for row in data:
#     if convert_int(row[-11]) > max_count:
#         max_count = convert_int(row[-11])
#         max_row = row
#
# print("밤 11시에 승차하는 인원이 가장 많은 역은 %s 역이고 해당 역의 승차 인원은 %s명이다."%(max_row[3], max_count))
# f.close()

#### 사용자에게 시간을 입력 받아 승차 인원이 많은 역을 표시 (p.137)
# import csv
#
# def convert_int(s):
#     return int(s.replace(',', ''))
#
# f = open("대중교통데이터2.csv", 'r')
# data = csv.reader(f)
# next(data)
# next(data)
#
# max_row = []
# max_count = 0
#
# input_time = int(input("승차시간 입력"))
# time = 2*input_time -4
# for row in data:
#     if convert_int(row[time]) > max_count:
#         max_count = convert_int(row[time])
#         max_row = row
#
# print(max_row[3], max_count)
# f.close()

#### 시간대별 승하차 인원 그래프 (p.140)
# import csv
# import matplotlib.pyplot as plt
#
# def convert_int(s):
#     return int(s.replace(',', ''))
#
# f = open("대중교통데이터2.csv", 'r')
# data = csv.reader(f)
# next(data)
# next(data)
#
# in_data = [0]*24
# out_data = [0]*24
#
# for row in data:
#     row[4:-1] = map(convert_int, row[4:-1])
#     for time in range(24):
#         index = 2 * time + 4
#         in_data[time] += row[index]
#         out_data[time] += row[index + 1]
#
# plt.rc('font', family="Malgun Gothic")
# plt.title("시간대별 승하차 인원")
# plt.plot(in_data, label='승차')
# plt.plot(out_data, label='하차')
# plt.xticks(range(24), range(4, 28))
# plt.legend()
# plt.show()
#
# f.close()

#### 사용자에게 역을 입력 받아 시간별 승차 인원 그래프 보이기 (p.143)
import csv
import matplotlib.pyplot as plt

def convert_int(s):
    return int(s.replace(',', ''))

f = open("대중교통데이터2.csv", 'r')
data = csv.reader(f)
next(data)
next(data)

station = input('차트를 보고 싶은 역은?')
station_row = []

for row in data:
    row[4:-1] = map(convert_int, row[4:-1])
    if station == row[3]:
        station_row = row
        break

plt.bar(range(24), station_row[4:-1:2])
plt.xticks(range(24), range(4, 28))
plt.show()

f.close()

