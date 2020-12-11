# 네이버 영화 리뷰 추출(단일 페이지)

# DOM구조 주요 부분
# Element <tr>
#     |
#     |------Element <td>
#     |------Element <td>---------------Attribute : class="title"
#                      |            |
#                      |            |---- Text "마지막 배위에 장면에서 눈물남 ㅠㅠ " : 리뷰
#                      |            
#                      |-----Element <a>
#                      |-----Element <div>
#                               |
#                               |------Element <span>
#                               |------Element <em>--------- Text "8" : 리뷰 평점