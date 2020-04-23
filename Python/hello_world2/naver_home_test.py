# import requests
# import bs4
#
# html = requests.get("https://www.naver.com/")
# # print(html.status_code)
# if html.status_code == 200:
#     print("정상페이지")
#     bs_object = bs4.BeautifulSoup(html.text, "html.parser")
#     # print(bs_object)
#     li_tags = bs_object.findAll("li",{"class":"ca_item"})
#     for tag in li_tags:
#         print(tag.text)
# else:
#     print("오류페이지")
