import json

from django.core.exceptions import MultipleObjectsReturned
from django.http            import JsonResponse
from django.views           import View
#from django.db.models       import Q

from .models      import Food

class FoodView(View):
    def get(self, request, food_id):
        try:
            food             = Food.objects.get(id=food_id)
            recomanded_foods = Food.objects.filter(
                categoryfood__category_id=food.categoryfood_set.first().id
            )

            required_option = [{
                    'id'      : required_option.id,
                    'food_id' : food.id,
                    'name'    : required_option.name,
                    'price'   : required_option.price
                }for required_option in food.requiredoption_set.all()]

            select_option = [{
                    'id'      : select_option.id,
                    'food_id' : food.id,
                    'name'    : select_option.name,
                    'price'   : select_option.price,
                }for select_option in food.selectoption_set.all()]

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
                'image'            : [image.image_url for image in food.foodimage_set.all()],
                'required_food'    : required_option,
                'select_food'      : select_option,
                'recommend_food'   : [{
                    'name'  : food.name,
                    'price' : food.price,
                    'image' : food.foodimage_set.filter(food=food).first().image_url
                } for food in recomanded_foods]
            }

            return JsonResponse({'message':result}, status=200)

        except Food.DoesNotExist:
            return JsonResponse({'message':'NOT EXIST'}, status=404)

        except MultipleObjectsReturned:
            return JsonResponse({'message':'MULITIPLE FOODS'}, status=400)

class SearchView(View):
       def get(self, request):
            food_search = request.GET.get('food_search', None)

            if not food_search:
                return JsonResponse({'product_list' : []}, status=200)

            foods = Food.objects.filter(name__icontains=food_search)
            product_list = [{
                'id'                    : foods.id,
                'title_name'            : foods.name,
                'price'                 : foods.price,
                'detail_image'          : foods.detail_image.first().image_url,
                'discount'              : foods.discount,
                'discounted_price'      : foods.discounted_price,
                'review_count'          : foods.review_count
            } for food in foods] if foods else []
                    
            return JsonResponse({'product_list' : product_list}, status=200)


            