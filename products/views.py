import json

from django.core.exceptions import MultipleObjectsReturned
from django.db.models.fields import URLField
from django.http            import JsonResponse
from django.views           import View

from .models      import CategoryFood, Food, Category, FoodImage, RequiredOption, SelectOption

class FoodView(View):
    def get(self, request):
        try:
            food_id          = request.GET['food_id']
            category_id      = request.GET['category_id']
            food             = Food.objects.get(id=food_id)
            required_options = RequiredOption.objects.filter(food=food_id)
            select_options   = SelectOption.objects.filter(food=food_id)
            images           = FoodImage.objects.filter(food=food_id)
            recommend_foods  = CategoryFood.objects.filter(category=category_id)
            recommend_list   = []
            recommend_image  = ''

            if not recommend_foods.exists():
                recommend_list = []
            else: 
                for recommend_food in recommend_foods:
                    if recommend_food.food !=food:                        
                        if not FoodImage.objects.filter(food=recommend_food.food).exists():
                            recommend_image = ''
                        else:
                            recommend_image = FoodImage.objects.filter(food=recommend_food.food).first()

                        recommend_list.append({
                                'name'  : recommend_food.food.name,
                                'price' : recommend_food.food.price,
                                'image' : (recommend_image.image_url if FoodImage.objects.filter(food=recommend_food.food).exists() else recommend_image)
                        })
                        
            if not images.exists():
                image = []
            else:
                image = [image.image_url for image in images]
                
            if not select_options.exists():
                required_option = []
            else:
                required_option = [{
                        'id'      : required_option.id,
                        'food_id' : food.id,
                        'name'    : required_option.name,
                        'price'   : required_option.price
                    }for required_option in required_options]
            
            if not select_options.exists():
                select_option = []
            else:
                select_option = [{
                        'id'      : select_option.id,
                        'food_id' : food.id,
                        'name'    : select_option.name,
                        'price'   : select_option.price,
                    }for select_option in select_options]

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
                'image'            : image,
                'required_food'    : required_option,
                'select_food'      : select_option,
                'recommend_food'    : recommend_list
            }

            return JsonResponse({'message':result}, status=200)

        except Food.DoesNotExist:
            return JsonResponse({'message':'NOT EXIST'}, status=404)
        except MultipleObjectsReturned:
            return JsonResponse({'message':'MULITIPLE FOODS'}, status=400)