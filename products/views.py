import json

from django.core.exceptions import MultipleObjectsReturned
from django.http            import JsonResponse
from django.views           import View

from .models      import Food, Category, FoodImage, RequiredOption, SelectOption

class FoodView(View):
    def get(self, request, food_id):
        try:
            food             = Food.objects.get(id=food_id)

            result = {
                'name'             : food.name,
                'price'            : food.price,
                'discount'         : food.discount,
                'discounted_price' : food.discounted_price,
                'star_score'       : food.star_score,
                'review_count'     : food.review_count,
                'detail_image'     : food.detail_image,
                'create_at'        : food.create_at,
                'update_at'        : food.update_at,
                'image'            : [image.image_url for image in FoodImage.objects.filter(food=food_id)],
                'required_food'    : [{
                        'food_id' : food.id,
                        'name'    : required_option.name,
                        'price'   : required_option.price,
                    }for required_option in RequiredOption.objects.filter(food=food_id)],
                'select_food'      : [{
                        'food_id' : food.id,
                        'name'    : select_option.name,
                        'price'   : select_option.price,
                    }for select_option in SelectOption.objects.filter(food=food_id)]
            }

            return JsonResponse({'message':result}, status=200)

        except Food.DoesNotExist:
            return JsonResponse({'message':'NOT EXIST'}, status=404)
        except MultipleObjectsReturned:
            return JsonResponse({'message':'MULITIPLE FOODS'}, status=400)