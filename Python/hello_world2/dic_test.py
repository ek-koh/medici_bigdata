# dic = {"boy": "소년", "school": "학교", "book": "책"}
# print(dic["boy"])
# print(dic["student"])
# print(dic.get("boy", "사전에 없음"))
# print(dic.get("student"))
# print(dic.get("student", "사전에 없음"))

# dic = {"boy": "소년", "school": "학교", "book": "책"}
#
# def dic_find(noun):
#     if noun in dic:
#         print("사전에 있습니다")
#     else:
#         print("사전에 없습니다")
#
# dic_find("book")
# dic_find("student")

# if "student" in dic:
#     print("사전에 있습니다")
# else:
#     print("사전에 없습니다")
# if "boy" in dic:
#     print("사전에 있습니다")
# else:
#     print("사전에 없습니다")


####사전관리(p.232)
# dic = {"boy": "소년", "school": "학교", "book": "책"}
# dic["boy"] = "남자애"
# dic["girl"] = "여자애"
#
# print(dic)
#
# del dic["boy"]
# print(dic)

# dic = {"boy": "소년", "school": "학교", "book": "책"}
# print(dic.keys())
# print(dic.values())
# print(dic.items())

# dic = {"boy": "소년", "school": "학교", "book": "책"}
# dic2 = {"student": "학생", "teacher": "선생님", "book": "서적"}
# dic2.update(dic)
# print(dic2)
# print(dic)

# song = """By The RivErs of babylon, there we sat down
# yeah we wept, when we remember zion.
# when the wicked carried us away in captivity
# required from us a song
# new how shall we sing the lord's song in a strange land
# """
#
# alphabet = {}
# for c in song:
#     if c.isalpha() == False:
#         continue
#
#     c = c.lower()
#     if c in alphabet:
#         alphabet[c] += 1
#     else:
#         alphabet[c] = 1
#
# print(alphabet)
#
# key = alphabet.keys()
# key.sort()
# print(key)
#
# for c in key:
#     print(c, "->", alphabet[c])
#
# count_max = max(alphabet.values())
# print(count_max)

##### 여기서부터 이 파일 끝까지는 12/06 수업 결석해서 혼자 해본 것
####집합

# asia = {"Korea", "China", "Japan"}
# asia.add("Vietnam")
# print(asia)
# asia.add("China")
# print(asia)
# asia.remove("Japan")
# print(asia)
# asia.update({"Singapore", "Hongkong", "Korea"})
# print(asia)


# two = {2,4,6,8,10,12}
# three = {3,6,9,12,15}
#
# print("교집합", two & three)
# print("합집합", two | three)
# print("차집합", two - three)
# print("차집합", three - two)
# print("배타적 차집합", two ^ three)

#### 부분집합 연산을 사용해보자
# mammal = {"코끼리", "고릴라", "사자", "고래", "사람", "원숭이", "개"}
# primate = {"사람", "원숭이", "고릴라"}
#
# if "사자" in mammal:
#     print("사자는 포유류이다")
# else:
#     print("사자는 포유류가 아니다")
#
# print(primate<=mammal)
# print(primate<mammal)
# print(primate<=primate)
# print(primate<primate)

#### enumerate (p.248)
# score = [88,95,70,100,99]
# no = 1
# for s in score:
#     print(no, "번 학생의 성적:", s)
#     no += 1

# for no in range(len(score)):
#     print(no+1, "번 학생의 성적:", score[no])

# for no, s in enumerate(score,1):
#     print(no, "번 학생의 성적:", s)

# print(list(enumerate(score)))
# race = ['저그', '테란', '프로토스']
# print(list(enumerate(race)))

#### zip(p.252)
# yoil = ["월", "화", "수", "목", "금", "토", "일"]
# food = ["갈비탕", "순대국", "칼국수", "삼겹살"]
#
# for y, f in zip(yoil, food):
#     print("%s요일 메뉴: %s"%(y,f))

#### 람다함수 (p.253)
# def flunk(s):
#     return s<60
#
# score = [45, 89, 72, 53, 94]
# for s in filter(flunk, score):
#     print(s)


# score = [45, 89, 72, 53, 94]
# for s in filter(lambda x:x<60,score):
#     print(s)

# score = [45, 89, 72, 53, 94]
# def half(s):
#     return s/2
#
# for s in map(half, score):
#     print(s)

# score = [45, 89, 72, 53, 94]
# for s in map(lambda x:x/2,score):
#     print(s)


#### 컬렉션의 사본
#### 리스트는 실제 복사하는 게 아니라 원래 거 놓고 참조하는 개념
# list1 = [1,2,3]
# list2 = list1
#
# list2[1] = 100
# print(list1)
# print(list2)

#### copy method
# list1 = [1,2,3]
# list2 = list1.copy()
#
# list2[1] = 100
# print(list1)
# print(list2)

#### 리스트 안에 리스트
# list1 = [1,2,3]
# list2 = [list1,4,5]   # 여기 list1은 카피가 아니라 가리키고 있는 것
# list3 = list2.copy()    # list3의 list1값 역시 list1참조
#
# list3[0][1] = 99
# print(list1)
# print(list2)
# print(list3)

# import copy
# list1 = [1,2,3]
# list2 = [list1,4,5]
# list3 = copy.deepcopy(list2)
#
# list3[0][1] = 99
# print(list1)
# print(list2)
# print(list3)

# list1 = [1,2,3]
# list2 = list1
# list3 = list1.copy()
#
# print("list1==list2:", list1 is list2)
# print("list1==list3:", list1 is list3)
# print("list2==list3:", list2 is list3)

###### 표준 모듈 (module_test.py)
# import math
#
# print(math.sin(math.radians(45)))
# print(math.sqrt(2))
# print(math.factorial(5))

# import statistics
# score = [30,40,60,70,80,90]
# print(statistics.mean(score))
# print(statistics.harmonic_mean(score))
# print(statistics.median(score))
# print(statistics.median_low(score))
# print(statistics.median_high(score))

# import time
# print(time.time())
# print(time.ctime())
# print(time.localtime())
#
# now = time.localtime()
# print("%d년 %d월 %d일" % (now.tm_year, now.tm_mon, now.tm_mday))
# print("%d:%d:%d" % (now.tm_hour, now.tm_min, now.tm_sec))

# import datetime
#
# now = datetime.datetime.now()
# print("%d년 %d월 %d일" % (now.year, now.month, now.day))
# print("%d:%d:%d" % (now.hour, now.minute, now.second))

# import time
# start = time.time()
# for a in range(10000):
#     print(a)
# end = time.time()
# print()
# print(end-start)

# import calendar
# print(calendar.calendar(2019))
# print(calendar.month(2019, 12))

# import calendar
# yoil = ["월", "화", "수", "목", "금", "토", "일"]
# day = calendar.weekday(2019, 12, 10)
# print("오늘은 "+yoil[day]+"요일이다")

# import random
# for i in range(5):
#     print(random.random())
#
# for i in range(5):
#     print(random.randint(1, 10))

# import random
# a = random.randint(1, 9)
# b = random.randint(1, 9)
# question = "%d + %d =?" % (a, b)
# c = int(input(question))
# if c == a + b:
#     print("정답입니다")
# else:
#     print("틀렸습니다")
#

# import random
# menu = ["칼국수", "쌀국수", "잔치국수", "온국수"]
# # a = random.randint(1, 4)
# # print("오늘 먹을 점심메뉴는", menu[a])
# random.shuffle(menu)
# print(menu.pop())


#### 로또번호
# import random
#
# lotto = []
# while True:
#     if len(lotto) == 6:
#         break
#     num = random.randint(1, 45)
#     if num in lotto:
#         continue
#     else:
#         lotto.append(num)
#
# print(lotto)

# import sys
#
# print("버전:", sys.version)
# print("플랫폼:", sys.platform)
# print("바이트 순서:", sys.byteorder)
# print("모듈 경로:", sys.path)
# sys.exit(0)

######## 예외처리
# str = "89점"
# # try:
# #     score = int(str)
# #     print(score)
# # except:
# #     print("예외가 발생했습니다")
# # print("작업완료")

#### 예외의 종류(p.292)
# str = "89"
# try:
#     score = int(str)
#     print(score)
#     a = str[5]
# except ValueError:
#     print("점수의 형식이 잘못되었습니다.")
# except IndexError:
#     print("첨자의 범위를 벗어났습니다.")
# except TypeError:
#     print("타입 오류 발생")
# print("프로그램 정상 종료")

####p.294
# def calcsum(n):
#     if n<0:
#         raise ValueError
#     sum = 0
#     for i in range(n+1):
#         sum += i
#     return sum
#
# try:
#     print(calcsum(10))
#     print(calcsum(-10))
# except ValueError:
#     print("값이 잘못되었습니다.")
# print("프로그램 정상종료")

#### 자원정리 (p.297)
# try:
#     print("네트워크 접속")
#     a = 2/0
#     print("네트워크 통신 수행")
# except ZeroDivisionError:
#     print("나누기오류")
# finally:
#     print("접속 해제")
# print("작업 완료")

#### 파일 쓰기(p.301)
# file = open("live.txt", "w", encoding= "UTF-8")
# file.write("""
# 삶이 그대를 속일지라도
# 슬퍼하거나 노하지 말라!
# 우울한 날들을 견디면
# 믿으라, 기쁨의 날이 오리니
# """)
# file.close()

# try:
#     file = open("live.txt", "r", encoding="UTF-8")
#     text = file.read()
#     print(text)
# except FileNotFoundError:
#     print("파일이 없습니다")
# finally:
#     file.close()

# try:
#     file = open("live.txt", "r", encoding="UTF-8")
#     line = 1
#     while True:
#         row = file.readline()
#         if not row:
#             break
#         print(str(line)+":"+row, end='')
#         line += 1
#     file.close()
# except FileNotFoundError:
#     print("파일이 없습니다")
# finally:
#     file.close()

# file = open("live.txt", "a", encoding="UTF-8")
# file.write("\n\n푸쉬킨 형님의 말씀이었습니다.")
# file.close()

# file = open("live.txt", "r", encoding="UTF-8")
# text = file.read()
# print(text)

#### 파일 관리 실습 (p.308)
# import os

# def dumpdir(path):
#     files = os.listdir(path)
#     for f in files:
#         fullpath = path + "\\" + f
#         if os.path.isdir(fullpath):
#             print("[", fullpath, "]")
#         else:
#             print("\t", fullpath)
#
# dumpdir(r"C:\Users\B0113\Desktop\문서_고은경\1-2주차 python_django")


#### 패키지 (p.313)
# import calc.add
# calc.add.outadd(1,2)

# import report.table
# report.table.printreport()

#### 모듈의 내부 (p. 316)
# import sys
# import math
#
# print(sys.builtin_module_names)
# print(dir(math))

