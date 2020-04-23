# import requests
# import bs4
#
# html = requests.get("https://search.naver.com/search.naver?query=양천구 날씨")
# # print(html.status_code)
#
# bs_object = bs4.BeautifulSoup(html.text, "html.parser")
# # print(bs_object)
#
# indicator_tag = bs_object.find("dl", {"class": "indicator"})
# # print(indicator_tag)
#
# dd_tags = indicator_tag.findAll("span",{"class":"num"})
# text_dd = ["미세먼지", "초미세먼지", "오존지수"]
# for text, tag in zip(text_dd, dd_tags):
#     print(text, tag.text)


#### 크롤링 실습
# import requests
# import bs4
#
#
# html1 = requests.get("https://search.naver.com/search.naver?query=양천구 날씨")
# html2 = requests.get("https://search.naver.com/search.naver?query=강남구 날씨")
# html3 = requests.get("https://search.naver.com/search.naver?query=관악구 날씨")
# html = [html1,html2,html3]
# # print(html.status_code)
# add = ["양천구", "강남구", "관악구"]
# for gu, ob in enumerate(html):
#     print(gu)
#     bs_object = bs4.BeautifulSoup(ob.text, "html.parser")
# # print(bs_object)
#
#     indicator_tag = bs_object.find("dl", {"class": "indicator"})
# # print(indicator_tag)
#     dd_tags = indicator_tag.findAll("span",{"class":"num"})
#     text_dd = ["미세먼지", "초미세먼지", "오존지수"]
#     for ad, text, tag in zip(add, text_dd, dd_tags):
#         print(text, tag.text)

# import requests
# import bs4
#
# def weather(keyword):
#
#     html = requests.get("https://search.naver.com/search.naver?query=" + keyword+"날씨")
#     # print(html.status_code)
#
#     bs_object = bs4.BeautifulSoup(html.text, "html.parser")
#     # print(bs_object)
#
#     indicator_tag = bs_object.find("dl", {"class": "indicator"})
#     # print(indicator_tag)
#
#     dd_tags = indicator_tag.findAll("span",{"class":"num"})
#     text_dd = ["미세먼지", "초미세먼지", "오존지수"]
#     print(keyword, "날씨정보를 안내합니다.")
#     for text, tag in zip(text_dd, dd_tags):
#         print( text, tag.text)
#
# # add = ["양천구","강남구","관악구"]
# # for address in add:
# #     weather(address)
#
# # weather("관악구")
# # print()
# # weather("양천구")
#
# weather(input("지역을 입력하세요:"))