import bs4

html = """
<!DOCTYPE html>
<html>
   <head>
       <title>웹 크롤링 실습</title>
   </head>
<body>
   <h1 class="green">1. 웹 크롤링 실습 페이지 입니다.</h1>
   <h1 class="red">2. 웹 크롤링 실습 페이지 입니다.</h1>
   <p>웹 크롤링 실습 p 태그 입니다.</p>
</body>
</html>"""

bs4_object = bs4.BeautifulSoup(html, "html.parser")
# print(bs4_object.find("h1"))
# print(bs4_object.find("h1").text)
# h1_tags = bs4_object.findAll("h1")
# print(h1_tags)
# print(h1_tags[0])
# print(h1_tags[0].text)

# for tag in h1_tags:
#     print(tag.text)

# h1_tag_red = bs4_object.find("h1", {"class": "red"})
# print(h1_tag_red)
# print(h1_tag_red.text)

# h1_tag_red_green = bs4_object.find("h1", {"class": {"red", "green"}})
# print(h1_tag_red_green)
# print(h1_tag_red_green.text)

h1_tags_red_green = bs4_object.findAll("h1", {"class": {"red","green"}})
print(h1_tags_red_green)
for tag in h1_tags_red_green:
    print(tag.text)
