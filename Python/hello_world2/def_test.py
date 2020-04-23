# def calcsum(n):
#     sum = 0
#     for num in range(n+1):
#         sum += num
#     return sum
#
#
# print("~4까지 합은", calcsum(4))
# print("~10까지 합은", calcsum(10))
#
# def calcsum():
#     sum = 0
#     for num in range(11):
#         sum += num
#     return sum
#
# print("~10까지 합은", calcsum())

# def calcsumrange(start, end):
#     sum = 0
#     for num in range(start, end+1):
#         sum += num
#     return sum
#
#
# print("3~7까지 합은", calcsumrange(3,7))

# def calcsum(n):
#     sum = 0
#     for num in range(n+1):
#         sum += num
#     print(n, "까지의 합은", sum)
#
# calcsum(10)
# calcsum(20)
#
# print(print())

# def calcsum(n):
#     pass

# def calcsum(*args):
#     sum = 0
#     for num in args:
#         sum += num
#     return sum
#
#
# print("합은?", calcsum(1,2,3,4,5,6,7))
# print("합은?", calcsum(32,3,5,3))

#인수의 기본값(p.151)

# def calcsum(start, end, step = 1, plus = 0):
#     sum = 0
#     for num in range(start, end + 1, step):
#         sum += num
#     return sum + plus
# print("~10까지의 합은?", calcsum(0,10))
# print("~10까지의 합은?", calcsum(1,10))
# print("~10까지 짝수의 합은?", calcsum(0,10,2))
# print("~10까지의 합에다가 플러스 1은?", calcsum(0,10,1,1))

#키워드 인수(p.153)

# def calcsum(start, end, step):
#     sum = 0
#     for num in range(start, end + 1, step):
#         sum += num
#     return sum
#
#
# print("10까지 더하면?", calcsum(0,10,1))
# print("10까지 더하면?", calcsum(start=0,end=10,step=1))
# print("10까지 더하면?", calcsum(0,step=1,end=10))
# print("10까지 더하면?", calcsum(start=0,10,1)) #이렇게 쓰면 에러

#키워드 가변인수(p.155)
# def calcsum(**args):
#     start = args['start']
#     end = args['end']
#     step = args['step']
#
#     sum = 0
#     for num in range(start, end + 1, step):
#         sum += num
#     return sum
#
# print("~10까지 합은?", calcsum(start=0,end=10,step=1))



# def calcscore(name, *ints, **op):
#     print(name)
#     sum = 0
#     for num in ints:
#         sum += num
#     print("총점은?",sum, end=' ')
#     if op['avg'] == True:               #노란 줄은 굳이 True 안쓰고 op['avg']: 해도 되는 것
#         print("그리고 평균은?", sum/len(ints))
#     else:
#         print("평균은 알아서 구하렴")
#
# calcscore("아무나", 90,100,100,avg=True)
# print()
# calcscore("아무나2", 100,90,80,70, avg=False)

#지역변수(p.159)
# def kim_fn():
#     temp = "김과장의 함수"
#     print(temp)
#
# kim_fn()
# print(temp) #에러

#이러면 에러 안남
# temp = "김과장의 함수"
# def kim_fn():
#     print(temp)
#
# kim_fn()
# print(temp)

#전역 변수(p.160)
# salerate = 0.9
# def kim():
#     print("오늘의 할인율",salerate)
#
# def lee():
#     price = 1000
#     print("가격은:", int(price * salerate),"원")
#
# kim()
# salerate = 1.1
# lee()

# def kim():
#     global price
#     price = 1000
#
# kim()
# print(price)

#docstring(p.163)
# def calcsum(n):
#     """0부터 n까지 더하는 함수 입니다.
#     n은 마지막 숫자 입니다"""
#     sum = 0
#     for num in range(n+1):
#         sum += num
#     return sum
# print(calcsum(10))
# help(calcsum)




