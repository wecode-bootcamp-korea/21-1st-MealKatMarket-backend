from django.http          import JsonResponse
from django.views         import View

from .models import Category,CategoryFood,Food,FoodImage

class FoodlistView(View):
    def get(self, request):

        foods = Food.objects.all()
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