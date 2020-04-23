# import requests
# import bs4
#
# html = requests.get("https://comic.naver.com/webtoon/weekday.nhn")
# bs_object = bs4.BeautifulSoup(html.text, "html.parser")
# # print(bs_object)
#
# webtoon_all_tag = bs_object.find("div", {"class": "list_area daily_all"})
# # print(webtoon_all_tag)
# for webtoon in webtoon_all_tag.findAll("li"):
#     print(webtoon.find("a",{"class":"title"}).text)
#     print(webtoon.find("img")["src"])


# import requests
# import bs4
#
# webtoon_title = []
# webtoon_img = []
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
#         print(webtoon.find("a")['title'].replace('\n',''))
#         print(webtoon.find("dd", {"class": "desc"}).text.replace('\n',''))
#         print("평점:", webtoon.find("strong").text)
#         print(webtoon.find("img")["src"])
#         if webtoon.find("em", {"class": "ico_updt"}) != None :
#             print("UP")
#         else:
#             print("휴재")
#
#         print()
#
#
# yoil1 = ["mon"]
# for yo in yoil1:
#     yoil(yo)
#
# html = """
# <!doctype html>
# <html lang="ko">
#    <head>
#    <meta charset="utf-8">
#       <title>HTML</title>
#    </head>
#    <body>"""
#
# for title, img in zip(webtoon_title, webtoon_img):
#     html += "<img src=\"" + img + "\">" + title + "</img>\n"
#
# html += """
#    </body>
# </html>
# """
#
# file = open("webtoon.html", "w", encoding = "UTF-8")
# file.write(html)
# file.close()