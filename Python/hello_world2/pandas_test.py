#import pandas

# data = {
#     "국어": [10, 20, 30, 40],
#     "수학": [50, 60, 70, 80],
#     "영어": [100, 10, 20, 30]
# }
#
# df = pandas.DataFrame(data)
# df.to_excel("test_scores.xlsx")
# df.to_csv("test_scores_v2.csv", encoding="CP949")

# import matplotlib.pyplot as plt
# df = pandas.read_csv("test_scores_v2.csv", encoding="CP949")
# plt.bar(df["이름"], df["국어"])
# plt.show()


####네이버웹툰 자료 저장해보기
# import requests
# import bs4
# import pandas
#
# webtoon_title = []
# webtoon_img = []
# webtoon_name = []
#
# def yoil(y):
#     print("무슨 요일 웹툰인가요?:", y)
#     print()
#
#     html = requests.get("https://comic.naver.com/webtoon/weekdayList.nhn?week="+y)
#     bs_object = bs4.BeautifulSoup(html.text, "html.parser")
#     # print(bs_object)
#
#     webtoon_list_tags = bs_object.find("ul", {"class": "img_list"})
#     # print(webtoon_all_tag)
#     for webtoon in webtoon_list_tags.findAll("li"):
#         webtoon_title.append(webtoon.find('a')['title'])
#         webtoon_img.append(webtoon.find('img')['src'])
#         webtoon_name.append(webtoon.find("dd", {"class": "desc"}))
#         title = webtoon.find("a")['title'].replace('\n','')
#         name = (webtoon.find("dd", {"class": "desc"}).text.replace('\n',''))
#         img = list(webtoon.find("img")["src"])
#
# yoil("mon")
#
# data = {
#     "제목": webtoon_title,
#     "작가": webtoon_name,
#     "이미지": webtoon_img
# }
#
# df = pandas.DataFrame(data)
# df.to_excel("data.xlsx")



#### 정부혁신1번가 크롤링 실습
# import requests
# import bs4
# import pandas
#
# title = []
# url = []
# contents = []
#
# def page(p):
#
#     html = requests.get("https://www.innogov.go.kr/ucms/bbs/B0000042/list.do?sort=02&searchCnd=1&searchWrd=&pageIndex="+str(p)+"&menuNo=300125")
#     bs_object = bs4.BeautifulSoup(html.text, "html.parser")
#     # print(bs_object)
#     title_tags = bs_object.find("td", {"class": "tit"})
#     for sen in title_tags:
#         # title.append(sen.find("td", {"class": "tit"}))
#         # url.append(sen.find("a")["href"])
#         # contents.append((sen.find()))
#
#         # print(sen.find("td", {"class": "tit"}))
#         print(sen.text)
#
#
# page(1)

##### 실습 선생님이 한 것
import requests
import bs4
import pandas
title_list = []
detail_list = []
def detail(url):
    html = requests.get("https://www.innogov.go.kr" + url)
    bs_object = bs4.BeautifulSoup(html.text, "html.parser")
    print(bs_object.find("div", {"class": "dbData"}).text)
    detail_list.append(bs_object.find("div", {"class": "dbData"}).text)
def page(index):
    html = requests.get("https://www.innogov.go.kr/ucms/bbs/B0000042/list.do?sort=02&searchCnd=1&searchWrd=&pageIndex=" + str(index) + "&menuNo=300125")
    bs_object = bs4.BeautifulSoup(html.text, "html.parser")
    title_tags = bs_object.findAll('td', {"class": "tit"})
    if len(title_tags):
        for title in title_tags:
            print(title.text)
            try:
                detail(title.find('a')["href"])
                title_list.append(title.text)
            except:
                print("오류 : ", title.text)
        return False
    else:
        return True
# def innogov_crw():
#     page_num = 1
#     while True:
#         if page(page_num):
#             break
#         page_num += 1
# innogov_crw()
page(1)
data = {
    "제목": title_list,
    "내용": detail_list
}
df = pandas.DataFrame(data)
df.to_excel("innogov.xlsx")
