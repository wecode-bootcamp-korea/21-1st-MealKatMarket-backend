import json, requests

from django.http      import JsonResponse
from django.views     import View
from django.db.utils  import IntegrityError

from .models         import Wish
from products.models import Food
from users.models    import User
from users.utils     import login_decorator

class WishView(View):
    @login_decorator
    def post(self, request):
        try:
            food_id = request.GET['food_id']
            user    = request.users
            food    = Food.objects.get(id=food_id)

            if Wish.objects.filter(user=user, food=food_id).exists():
                return JsonResponse({'message':'FOOD INVALID'}, status=400)

            wish = Wish(
                user=user,
                food=food
            )

            wish.save()
        
            return JsonResponse({'message':'SUCCESS'}, status=201)
        
        except Food.DoesNotExist:
            return JsonResponse({'message':'NOT EXIST'}, status=404)
        except Food.MultipleObjectsReturned:
            return JsonResponse({'message':'MULTIPLE EXIST'}, status=400)
        except IntegrityError:
            return JsonResponse({'message':'FOOD INVALID'}, status=400)
    
    @login_decorator
    def delete(self, request):
        try:
            food_id = request.GET['food_id']
            food    = Food.objects.get(id=food_id)
            user    = request.users
            wish    = Wish.objects.get(user=user, food=food)

            wish.delete()
        
            return JsonResponse({'message':'SUCCESS'}, status=200)
        
        except Food.DoesNotExist:
           return JsonResponse({'message':'NOT EXIST'}, status=404)

    @login_decorator
    def get(self, request):
        try:
            user  = request.users
            wishes = Wish.objects.filter(user = user)
            
            if wishes.exists():
                result  = [{
                  'name'             : wish.food.name,
                  'price'            : wish.food.price,
                  'discount'         : wish.food.discount,
                  'discounted_price' : wish.food.discounted_price,
                  'star_score'       : wish.food.star_score,
                  'review_count'     : wish.food.review_count,
                  'detail_image'     : wish.food.detail_image,
                  'create_at'        : wish.food.create_at,
                  'update_at'        : wish.food.update_at,
                  'image'            : wish.food.foodimage_set.filter(food=wish.food).first().image_url
                } for wish in wishes]
            else:
                result=[]

            return JsonResponse({'message':result}, status = 200)
        except Wish.DoesNotExist:
           return JsonResponse({'message':'NOT EXIST'}, status=404)
