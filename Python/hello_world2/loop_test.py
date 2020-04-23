# student = 1
# while student <= 5:
#     print(student, "번째 학생의 성적을 처리했습니다.")
#     student += 1

# num=1
# sum=0
# while num<=10:
#     sum+=num
#     num+=1
# print("합계는", sum)

# result=1
# while result<=9:
#     print("2 x", result, "=", 2 * result)
#     result+=1

# for student in [1,3,5]:
#     print(student, "번째 학생의 성적을 처리했습니다.")

# sum = 0
# for num in [1,2,3,4,5,6,7,8,9,10]:
#     sum += num
# print(sum)

# sum = 0
# for num in range(1, 101):
#     sum += num
# print("합계는", sum)

# for num in range(1,10):
#     print("2 x", num, "=", 2*num)

# for x in range(1,51):
#     if x % 10 == 0:
#         print("+",end='')
#     else:
#         print("-",end='')

# for x in range(0,51):
#     if x % 10 ==0:
#         print("+",end='')
#     else:
#         print("-",end='')

# for x in range(1,11):
#     if x%2==1:
#         print(x, "홀수입니다")
#     else:
#         print(x, "짝수입니다")

# num=1
# while num<=10:
#     if num%2==1:
#         print(num,"홀수입니다")
#     else:
#         print(num,"짝수입니다")
#     num+=1

# score = [92, 80, 99, 120, 56]
# for num in score:
#     if num<0 or num>100:
#         break
#     print(num)

# score = [92, 80, 99, 120, 56]
# for num in score:
#     if num<0 or num>100:
#         continue
#     print(num)
# print("성적 처리 끝")

# score = [92,80,99,120,50]
# for num in score:
#     if num>100:
#         continue
#     print(num)
# print("성적 처리 끝")

dan=2
#hang=1을 여기에다 쓰면 3단부터는 출력 안됨.
#한 번 돌아가고 num=10인 상태로 고정되기 때문
# while dan<=9:
#     print(dan,"단")
#     hang = 1
#     while hang<=9:
#         print(dan,"x",hang,"=",dan*hang)
#         hang+=1
#     dan+=1
#     print()

# for dan in range(2,10):
#     print(dan,"단")
#     for num in range(1,10):
#         print(dan,"x",num,"=",dan*num)
#     print()

# print("3+4=?")
# while True:
#     num=input("정답을 입력하세요")
#     if num == "7":
#         break
#     else:
#         print("땡")
# print("정답입니다")

# for x in range(1,8):
#     print("*"*x)

# x=1
# while x<=7:
#     print("*"*(2*x-1))
#     x+=1

#이중 루프로

# for i in range(0,6):
#     for j in range(i+1):
#         print("*",end='')
#     print()

