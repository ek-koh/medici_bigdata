#첨자(p.168)
# s="python"
# print(s[2])
# print(s[-2])
#
# for c in s:
#     if c=="n":
#         print(c,end='')
#     else:
#         print(c, end='~')

# s[2]=k

#슬라이스(p.170)
# s="python"
# print(s[2:4])
# print(s[:3])
# print(s[2:])
# print(s[2:-2])

# s="20191204-164320.jpg"
# print(len(s))
# print("촬영날짜:",s[4:6],"월",s[6:8],"일")
# print("촬영시간:",s[9:11],"시",s[11:13],"분")
# print("확장자:",s[-3:])
# print("확장자:",s[16:])

#문자열 검색(p.174)
# s="python programming"
# print(len(s))
# print(s.find('o'))
# print(s.rfind('o'))
# print(s.index('o'))
# print(s.count('n'))
# print(s.find('b'))

#문자열 조사(p.175)
# s= "python programming"
# print('a' in s)
# print('pro' in s)
# print('proa' in s)
# print('b' not in s)
# print('python' not in s)

#문자열 조사(p.176)
# name = "고은경"
# if name.startswith("고"):
#     print("고씨입니다")
# if name.startswith("한"):
#     print("한씨입니다")

# file_name = "test_ing.jpg"
# if file_name.endswith(".jpg"):
#     print("그림 파일입니다")
# else:
#     print("오류입니다")
#
# file = "testㅇ"
#
# if file.isalpha():
#     print("알파벳으로만 이뤄져 있습니다")
# else:
#     print("오류입니다")

# height = input("키를 입력하세요")
# if height.isdecimal():
#     print("키:", height)
# else:
#     input("다시 입력해주세요. 숫자로만 입력되어야 합니다.")
#     print("키:", height)

#문자열변경(p. 179)
# s = "Good Morning, Kim. Nice to Meet You!"
# print(s.upper())
# print(s.lower())
# print(s)
#
# s = s.upper()
# print(s)

# s = "Good Morning, Kim. Nice to Meet You!"
# print(s.capitalize())
# print(s.title())
# print(s.swapcase())

# id = input("아이디를 입력하세요. 소문자만 가능합니다")
# if id.lower() == "python":
#     print("정답입니다")
# else:
#     print("땡")
# print(id)

# 그냥 혼자 해본 것
# id = input("아이디를 입력하세요. 소문자만 가능합니다")
# if id == "python":
#     print("정답입니다")
# else:
#     print("땡")
#     id = id.lower()
#
# print(id)

# s = "짜장 짬뽕 탕수육"
# print(s.split())
# for s1 in s.split():
#     print(s1)
# print
# s2 = "서울->대전->대구->부산"
# for s1 in s2.split("->"):
#     print(s1, "찍고 ", end='')
#
# s3 = "30.5:31.5:32.5:33.5"
# s3_new = s3.split(":")
# print(s3_new)

# s = "독도는 일본땅이다, 대마도는 일본땅이다"
# print(s.replace("일본", "한국"))
# print(s)

#새로 추가된 ppt
# print(",".join("abcd"))
# print(",".join(["a","b","c","d"]))

#문자열 포맷팅(p. 183)
# price = 500
# print("궁금하면", price, "원!")
# print("궁금하면 %d 원!"%price)

# value = 1234
# print("#####%d######"%value)
# print("#####%5d#####"%value)
# print("#####%10d#####"%value)
# print("#####%1d#####"%value)

# price = [30, 13500, 2000]
# for p in price:
#     print("가격: %d원" % p)
# for p in price:
#     print("가격: %7d원" % p)
# for p in price:
#     print("가격: %-7d원" % p)

# pie = 3.14159265
# print("%-10f" % pie)
# print("%-10.8f" % pie)
# print("%-10.6f" % pie)
# print("%-10.2f" % pie)

# t = "문"
# print("문자는 %c입니다" %t)

# t = "100%"
# print("문자는 %s니다" %t)

#신형포맷팅(p.189)
# name = "한결"
# age = 20
# height = 100
# percent = "%"
#
# print("이름: {} 나이: {} 키: {} 퍼센트: {}".format(name, age, height, percent))
#
# print("이름: {1} 나이: {0} 키: {2}".format(age, name, height))
#
# print("이름: {name} 나이: {age} 키: {h}".format(h=height, name=name, age=age))
