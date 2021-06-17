import json
from users.utils import login_decorator

from django.core.exceptions import MultipleObjectsReturned
from django.http            import JsonResponse
from django.views           import View
from django.db.models       import Q

from .models       import Food
from wishes.models import Wish

class FoodlistView(View):
    def get(self, request):
        category_id = request.GET.get('categoryId')
        sort        = request.GET.get('sort','?')
        page        = int(request.GET.get("page",1))

        page_size = 10
        limit     = int(page_size * page)
        offset    = int(limit - page_size)

        q = Q()

        if category_id:
            q = Q(categories__id=category_id)

        foods = Food.objects.filter(q).order_by(sort)[offset:limit]
        
        result = [{
            'id'               : food.id,
            'img_url'          : food.foodimage_set.first().image_url,
            'name'             : food.name,
            'price'            : food.price,
            'discount'         : food.discount,
            'discounted_price' : food.discounted_price,
            'star_score'       : food.star_score,
            'review_count'     : food.review_count,
            'create_at'        : food.create_at,
            'sale_status'      : (True if food.discount > 0 else False)
        }for food in foods]

        return JsonResponse({'result' : result}, status=200)

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
                } for food in recomanded_foods],
            }

            return JsonResponse({'message':result}, status=200)

        except Food.DoesNotExist:
            return JsonResponse({'message':'NOT EXIST'}, status=404)

        except MultipleObjectsReturned:
            return JsonResponse({'message':'MULITIPLE FOODS'}, status=400) 
    
class WishFoodView(View):
    @login_decorator
    def get(self, request, food_id):
        is_wised = Wish.objects.filter(user=request.users, food_id=food_id).exists()

        return JsonResponse({'wish_status' : is_wised}, status=200)

class SearchView(View):
       def get(self, request):
            keyword = request.GET.get('keyword', None)
            print("keyword :: ", keyword)

            if keyword == None:
                return JsonResponse({'product_list' : []}, status=200)

            if keyword != None:
                foods = Food.objects.filter(name__icontains=keyword)

                if foods == None:
                    return JsonResponse({'product_list' : []}, status=200)
                
                if foods != None:
                    product_list = [{
                        'id'                    : food.id,
                        'title_name'            : food.name,
                        'price'                 : food.price,
                        'detail_image'          : food.detail_image,
                        'discount'              : food.discount,
                        'discounted_price'      : food.discounted_price,
                        'review_count'          : food.review_count
                    } for food in foods]
                    
                    return JsonResponse({'product_list' : product_list}, status=200)