from django.http  import JsonResponse
from django.views import View

from .models import Category,CategoryFood,Food,FoodImage
class FoodlistView(View):
    def get(self, request):
        category_filter = request.GET.get('category')

        if category_filter == None:
            categoryfoods = CategoryFood.objects.all()
        else:
            category = Category.objects.get(id=category_filter)
            categoryfoods = category.categoryfood_set.all() # 카테고리에 묶여있는 중간테이블 전부를 표현

        result = []
        for food in categoryfoods:
            
            food_info = {
                'id'               : food.food.id, # 앞에 푸드는 for문의 푸드, 뒤는 테이블 컬럼명 푸드(정참조)
                'img_url'          : food.food.foodimage_set.first().image_url,
                'name'             : food.food.name,
                'price'            : food.food.price,
                'discount'         : food.food.discount,
                'discounted_price' : food.food.discounted_price,
                'star_score'       : food.food.star_score,
                'review_count'     : food.food.review_count,
                'create_at'        : food.food.create_at
            }
            result.append(food_info)

        return JsonResponse({'result' : result}, status=200)


# 1. 전체리스트 불러오기 
# 2. 카테고리 별로 불러오기 (all, 간편식, 밥, 면, 반찬, 간식, 음료)
# 3. restful.apl방식을 이용해서 필터링하기
# 4. 불러온 리스트를 별점 높은순, 후기 많은순으로 정렬하기