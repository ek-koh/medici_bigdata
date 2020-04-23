#리스트란?(p.194)
# score = [90,80,70,100,20]
# sum = 0
# for s in score:
#     sum += s
#
# print("총점은?", sum)
# print("평균은?", sum/len(score))

#리스트의 요소(p.196)
# nums = [1,2,3,4,5,6,7,8,9]
# print(nums[2:5])
# print(nums[:4])
# print(nums[4:])
# print(nums[1:7:2])

# score = [88, 95, 70, 100, 99]
# print(score[2])
# score[2] = 55
# print(score[2])
# print(score)

#이중 리스트(p. 199)
# lol = [[1,2,3],[4,5],[6,7,8,9]]
# print(lol[0])
# print(lol[2][3])
#
# for nums in lol:
#     for num in nums:
#         print(num, end='')
#     print()

#학생 성적 평균 예제
# score = [
#     [90,80,70,100],
#     [20,40,70,90],
#     [30,80,90,100]
# ]
#
# for nums in score:
#     sum = 0
#     for num in nums:
#         sum += num
#     print("총점은?", sum)
#     print("평균은?", sum/len(nums))
#     print()

#리스트 컴프리헨션(p.203)
# nums = [2*n for n in range(1,11)]
# print(nums)
#
# nums = []
# for n in range(1,11):
#     nums.append(n*2)
#
# print(nums)

# nums = [n for n in range(1,46)]
# print(nums)

#리스트 관리-추가(p.206)
# nums = [1, 2, 3, 4]
# nums.append(5)
# print(nums)
# nums.insert(2, 99)
# print(nums)

#### 리스트관리 - 삭제(p. 208)
# score = [90, 80, 77, 100, 29, 100, 79, 50]
# print(score)
# score.remove(100)
# print(score)
# del score[2]
# print(score)
# score[1:4] = []
# print(score)
# print(score.pop())
# print(score)
# print(score.pop())
# print(score)

####리스트관리 - 검색(p. 209)
# score = [90, 80, 77, 100, 29, 100, 79, 50]
# perfect = score.index(100)
# print("만점 받은 학생의 번호는 {}번입니다".format(perfect))
# print("만점 받은 학생 수는 {}명입니다".format(score.count(100)))

# score = [90, 80, 77, 100, 29, 100, 79, 50]
# print("최고 점수는 %d점입니다" % max(score))
# print("최저 점수는 %d점입니다" % min(score))
# print("학생 수는 %d명입니다" % len(score))

# ans = input('결제하시겠습니까?')
# if ans in ["y","yes","ok","예"]:
#     print("결제완료")
# else:
#     print('결제실패')

# ans = input("결제하시겠습니까?")
# if ans not in ["no", "n","아니오"]:
#     print("결제완료")
# else:
#     print("결제실패")

####리스트관리 - 정렬(p. 215)
# score = [90, 80, 77, 100, 29, 100, 79, 50]
# score.reverse()
# print(score)
# score.sort()
# print(score)
# score.reverse()
# print(score)

# score = [90, 80, 77, 100, 29, 100, 79, 50]
# sort_score = sorted(score)
# print(score)
# print(sort_score)
#
# reverse_score = sorted(score, reverse=True)
# print(reverse_score)

####튜플(p.218)
# score = (88, 95, 79, 100, 99)
# sum = 0
# for n in score:
#     sum += n
# print("총점은?",sum)
# print("평균은?", sum/len(score))

# score = 88, 95, 79, 100, 99
# sum = 0
# for n in score:
#     sum += n
# print("총점은?",sum)
# print("평균은?", round(sum/len(score),-2))

# tuple_value = 2,
# value = 2
# print(tuple_value)
# print(value)
# print(type(tuple_value))

####튜플로 가능한 일(p.222)
# score = 88, 95, 79, 100, 99
# print(score[2])
# print(score[:4])
# print(score[1:4])
# print(score+(5,6))
# print(score*3)
# print(score)

####튜플 언패킹(p.223)
# def aaa():
#     return 1,23,35
#
# print(aaa())
#
#
# member = ("이순신", "김유신", "강감찬")
# lee, kim, kang = member
# print(lee)
# print(kim)
# print(kang)

# score = [10, 20, 30, 40, 50]
# print(score)
# tu = tuple(score)
# print(tu)
# li = list(tu)
# print(li)
# li[2] = 300
# print(li)

####연습문제 1
# score1 = input("성적을 입력하세요")
# score2 = input("성적을 입력하세요")
# score3 = input("성적을 입력하세요")
# score4 = input("성적을 입력하세요")
# score5 = input("성적을 입력하세요")
#
# score = [score1, score2, score3, score4, score5]
# score.sort()
# print(score)

####연습문제 2 ~~ 시험에 나옴
# for n in range(1, 11):
#     if n % 3 == 0:
#         continue
#     else:               #else: 이거 안쓰고 다음줄 한 칸 왼쪽으로 가도 됨
#         print(n)

####실습문제1
# def score_max(*n):
#     max = n[0]
#     for num in n:
#         if max < num:
#             max = num
#     return max
#
#
# print(score_max(10,20,30, 100))

####실습문제2

# def avg(a, b, c):
#
#     return int((a+b+c)/3)
# print(avg(1, 2, 3))


