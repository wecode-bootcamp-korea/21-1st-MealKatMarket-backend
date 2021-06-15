import json

from django.core.exceptions import MultipleObjectsReturned
from django.http            import JsonResponse
from django.views           import View

from .models      import CategoryFood, Food, Category, FoodImage, RequiredOption, SelectOption

class FoodView(View):
    def get(self, request):
        try:
            food_id          = request.GET['food_id']
            category_id      = request.GET['category_id']
            food             = Food.objects.get(id=food_id)
            recommend_foods  = CategoryFood.objects.filter(category=category_id)
            recommend_list   = []

            if not recommend_foods.exists():
                recommend_list = []
            else: 
                for recommend_food in recommend_foods:
                    if recommend_food.food !=food:
                        if recommend_food.food.foodimage_set.first():
                            recommend_image = recommend_food.food.foodimage_set.first()
                            recommend_image = recommend_image.image_url
                        else:
                            recommend_image = ''

                        recommend_list.append({
                                'name'  : recommend_food.food.name,
                                'price' : recommend_food.food.price,
                                'image' : recommend_image
                        })
            
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
                'recommend_food'    : recommend_list
            }

            return JsonResponse({'message':result}, status=200)

        except Food.DoesNotExist:
            return JsonResponse({'message':'NOT EXIST'}, status=404)
        except MultipleObjectsReturned:
            return JsonResponse({'message':'MULITIPLE FOODS'}, status=400)