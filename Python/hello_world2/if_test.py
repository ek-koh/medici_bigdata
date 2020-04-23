# age=input("나이를 입력하세요: ")
# if int(age) < 19:
#     print("애들은 가라")

#이렇게도 가능
# age=int(input("나이를 입력하세요: "))
# if age<19:
#     print("애들은 가라")

# a=5
# if a==5:
#     print("a는 5이다")
#
# if a<5:
#     print("a는 5보다 작다")
#
# if a>5:
#     print("a는 5보다 크다")
#
# if a<=5:
#     print("a는 5보다 작거나 같다")
#
# if a>=5:
#     print("a는 5보다 크거나 같다")
#
# if a != 6:
#     print("a는 6이 아니다")

# if 0:
#     print("거짓")
#
# if 1:
#     print("참")
#
# if "":
#     print("거짓")
#
# if "asf":
#     print("참")

# country="Korea"
# if country=="korea":
#     print("대한민국입니다")
# if country=="Korea":
#     print("한국입니다")

# if "korea">"japan":
#     print("한국이 더 크다")
#
# if "korea"<"japan":
#     print("일본이 더 크다")
#
# if "9">"1":
#     print("9가 더 크다")

# if 99>10:
#     print("99가 더 크다")

# a = 3
# b = 5
#
# if a==3 and b==5:
#     print("3,5 And Ok")
#
# if a==3 and b==7:
#     print("a=3,b=7 and ok")
#
# if a==3 and not b==8:
#     print("and not ok")
#
# if a==3 or b==7:
#     print("3,7 or ok")
#
# if a==4 or b==7:
#     print("4,7 or ok")
#
# if not a==7 and b==5:
#     print("ok")

# age=30
# if age<19:
#     print("애들은 가라")
# print("공부 열심히 해야지")

# age=int(input("나이를 말씀해주세요: "))
# if age<19:
#     print("애들은 가라")
# else:
#     print("어서옵쇼,", end=' ')
#     print("즐거운 시간 되세요")

# age=22
# if age<19:
#     print("애들은 가라")
# elif age<25:
#     print("대학생입니다")
# else:
#     print("어서옵쇼")

# money = 12000
# if money>=20000:
#     print("탕수육을 먹자")
# elif money>=10000:
#     print("쟁반짜장을 먹자")
# elif money>=7000:
#     print("짬뽕을 먹자")
# elif money>=6000:
#     print("짜장면을 먹자")
# else:
#     print("단무지만 먹어ㅠㅠㅠ")

# man = True
# age = 12
# if man:
#     if age>19:
#         print("성인 남자입니다")
#     else:
#         print("소년입니다")

# age=12
# if age<19:
#     print("애들은 가라")
# else:
#     if age<25:
#         print("대학생입니다")
#     else:
#         print("성인입니다")

# money=7500
# # if money>20000:
# #     print("탕수육을 먹자")
# # else:
# #     if money>10000:
# #         print("쟁반 짜장을 먹자")
# #     else:
# #         if money>7000:
# #             print("짬뽕을 먹자")
# #         else:
# #             if money>6000:
# #                 print("짜장면을 먹자")
# #             else:
# #                 print("단무지나 드세요")

# import random
# print(random.randint(1,100))

#실습문제: 가위바위보
#1. 가위바위보 룰을 정하기
# 1=가위 2=바위 3=보자기
#2. 사용자에게 숫자 입력 받기 (1~3)
#3. random.randint  사용해서 1~3까지 랜덤한 숫자 얻기
#4. 조건 비교
#   - 비긴조건
#   - 이기는 조건
#    1: 랜덤숫자 3
#    2: 랜덤 숫자가 1
#    3: 랜덤 숫자가 2
#   - 지는 조건

import random
computer=random.randint(1,3)
user = int(input("1,2,3 중에 하나의 숫자를 선택하세요: "))
if user>=2:
    if user==computer+1:
        print(computer)
        print("이겼습니다")
    elif user==computer:
        print(computer)
        print("비겼습니다")
    else:
        print(computer)
        print("졌습니다")
else:
    if user==computer-2:
        print(computer)
        print("이겼습니다")
    elif user==computer:
        print(computer)
        print("비겼습니다")
    else:
        print(computer)
        print("졌습니다")
