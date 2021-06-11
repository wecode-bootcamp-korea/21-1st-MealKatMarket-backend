from django.http          import JsonResponse
from django.views         import View

from .models import Category,CategoryFood,Food,FoodImage

class FoodlistView(View):
    def get(self, request):


        #  = request.GET.get('category')
        # print('-------------')
        # print(products)
        # print('-------------')

        foods = Food.objects.all()
        # print(dir(foods[0].foodimage_set))
        # img = FoodImage.objects.first()
        
        result = []

        for food in foods:
            food_info = {
                'id'               : food.id,
                'img_url'          : food.foodimage_set.first().image_url,
                'name'             : food.name,
                'price'            : food.price,
                'discount'         : food.discount,
                'discounted_price' : food.discounted_price,
                'star_score'       : food.star_score,
                'review_count'     : food.review_count,
                'create_at'        : food.create_at
            }
            result.append(food_info)
        return JsonResponse({'result' : result}, status=200)


# 1. 전체리스트 불러오기 
# 2. 카테고리 별로 불러오기
# 3. restful.apl방식을 이용해서 필터링하기
# 4. 불러온 리스트를 별점 높은순, 후기 많은순으로 정렬하기