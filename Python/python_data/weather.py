import csv

file = open('기후데이터.csv', 'r')
data = csv.reader(file)

header = next(data)
print(header)
 #### 최고기온 찾기
max_temp = -999
max_row = []
for row in data:
    if len(row) < 7 or row[4] == '':
        continue
    # print(row[2], row[4])
    temp = float(row[4])
    if max_temp < temp:
        max_temp = temp
        max_row = row

print("최고 기온은:", max_row[2], max_temp)



#### 최저기온 찾기
import csv

file = open('기후데이터.csv', 'r')
data = csv.reader(file)

header = next(data)
# print(header)

min_temp = 1000
min_row = []
for row in data:
    if len(row) < 7 or row[6] == '':
        continue
    # print(row[2], row[6])
    temp = float(row[6])
    if min_temp > temp:
        min_temp = temp
        min_row = row

print("최저 기온은:", min_row[2], min_temp)

file.close()

