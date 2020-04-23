# score = [10, 20, 30, 40, 50, 60, 70, 80]
# sum1 = 0
# for i in score:
#     sum1 += i
#
# print("총점은", sum1)
# print("평균은", sum1/len(score))
#
#
# import statistics
#
# print("총점은", sum(score))
# print("평균은", statistics.mean(score))


#### 서울우유
# s = 2500 / 1
# m = 4200 / 1.8
# if s>m:
#     print("서울 우유가 더 비싸다")
# else:
#     print("매일 우유가 더 비싸다")
# print(int(s), int(m))

#### 가장 큰 숫자
# def big(*ints):
#     ma = 0
#     for i in ints:
#         if i > ma:
#             ma = i
#     return(ma)

    # return max(ints)

# print(big(2,300,4,111))

#### 로또 번호
import random

# lotto = []

# for a in range(6):
#     a = random.randint(1, 45)
#     lotto.append(a)
#
# for i in range():
# print(lotto.pop())

## 이걸로 하자
# lotto = list(range(1, 46))
# random.shuffle(lotto)
# for i in range(1, 7):
#     print(lotto.pop())


#### 남여 파트너 정하기
# male = ["슈퍼맨", "심봉사", "로미오", "이몽룡", "마루치"]
# # female = ["원더우먼", "뺑덕", "줄리엣", "성춘향", "아라치"]
# #
# # import random
# #
# # random.shuffle(male)
# # random.shuffle(female)
# # for m, f in zip(male, female):
# #     print(m, f)

#### 클래스 사용 전
# am = "아메리카노"
# am_p = 4100
#
# es = "에스프레소"
# es_p = 3900
#
# print(am+"는 가격이", am_p, "원입니다")
# print(es+"는 가격이", es_p, "원입니다")

#### 클래스 사용
# class Coffee:
#     def __init__(self, name, price):
#         self.name = name
#         self.price = price
#
#     def price_print(self):
#         print(self.name+"는 가격이", self.price,"원 입니다")
#
# am = Coffee("아메리카노", 4100)
# am.price = 10000
# am.price_print()
#
# es = Coffee("에스프레소", 3900)
# es.price_print()
#
# lat = Coffee("카페라떼", 4500)
# lat.price_print()

#### 클래스의 상속
# class Ep:
#     def __init__(self):
#         self.price = 3900
#     def make(self):
#         print("원두를 갈아 넣습니다")
#         print("원두를 추출합니다")
#
#     def get_price(self):
#         print("가격은", self.price, "원 입니다")


# class Am:
#     def __init__(self):
#         self.price = 4100
#
#     def make(self):
#         print("원두를 갈아 넣습니다")
#         print("원두를 추출합니다")
#         print("물을 추가합니다")
#
#     def get_price(self):
#         print("가격은", self.price,"원 입니다")
#
#
# class Lat:
#     def __init__(self):
#         self.price = 4600
#
#     def make(self):
#         print("원두를 갈아 넣습니다")
#         print("원두를 추출합니다")
#         print("우유를 추가합니다")
#
#     def get_price(self):
#         print("가격은", self.price, "원 입니다")
#
# la = Lat()
# la.get_price()
#
# am = Am()
# am.get_price()
#
# ep = Ep()
# ep.get_price()

# class Ep:
#     def __init__(self):
#         self.price = 10000
#     def make(self):
#         print("원두를 갈아 넣습니다")
#         print("원두를 추출합니다")
#
#     def get_price(self):
#         print("가격은", self.price, "원 입니다")
#
#
# class Am(Ep):
#     def __init__(self):
#         super().__init__()
#         self.price += 200
#
#     def make(self):
#         super().make()
#         print("물을 추가합니다")
#
# am = Am()
# am.get_price()
#
#
# class Lat(Ep):
#     def __init__(self):
#         super().__init__()
#         self.price += 700
#
#     def make(self):
#         super().make()
#         print("우유를 추가합니다")
#
# la = Lat()
# la.get_price()
# la.make()
#
# class Mak(Lat):
#     def __init__(self):
#         super().__init__()
#         self.price += 400
#
#     def make(self):
#         super().make()
#         print("시럽을 추가합니다")
#
# maki = Mak()
# maki.get_price()
#
# print(am)

#### 여기 답안이랑 비교해서 보기. 다 못씀
# class Es:
#     count = 0
#     def __init__(self):
#         self.price = 3900
#         Es.count += 1
#     def get_price(self):
#         print(" 가격은" + str(self.price)+"원 입니다")
#     @staticmethod
#     def sale_count():
#         print("에스프레소가 "+str(Es.count)+"잔 팔렸습니다")
#
# es = Es()
# es.sale_count()

# class Ep:
#     def __init__(self):
#         self.price = 10000
#     def make(self):
#         print("원두를 갈아 넣습니다")
#         print("원두를 추출합니다")
#
#     def get_price(self):
#         print("가격은", self.price, "원 입니다")
#
#
# class Am(Ep):
#     def __init__(self):
#         super().__init__()
#         self.price += 200
#
#     def make(self):
#         super().make()
#         print("물을 추가합니다")
#
#     def __str__(self):
#         return "아메리카노 가격은 " + str(self.price) + "원 입니다"
#
# am = Am()
# print(am)