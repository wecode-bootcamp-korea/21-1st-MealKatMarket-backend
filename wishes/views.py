import json, requests

from django.http      import JsonResponse
from django.views     import View
from django.db.utils  import IntegrityError

from .models         import Wish
from products.models import Food
from users.utils     import login_decorator

class WishView(View):
    @login_decorator
    def post(self, request):
        try:
            data = json.loads(request.body)

            if Wish.objects.filter(user=request.users, food_id=data['food_id']).exists():
                return JsonResponse({'message':'DUPLICATED_FOOD'}, status=400)

            wish = Wish(user=request.users,food_id=data['food_id'])
            wish.save()
        
            return JsonResponse({'message':'SUCCESS'}, status=201)
        
        except IntegrityError:
            return JsonResponse({'message':'FOOD INVALID'}, status=400)
    
    @login_decorator
    def delete(self, request, food_id):
        try:
            wish = Wish.objects.get(user=request.users, food_id=food_id)
            wish.delete()
        
            return JsonResponse({'message':'NOT_CONTENT'}, status=204)
        
        except Wish.DoesNotExist:
           return JsonResponse({'message':'NOT EXIST'}, status=404)

    @login_decorator
    def get(self, request):
        wishes = Wish.objects.filter(user = request.users)
            
        
        result  = ([{
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
        } for wish in wishes] if wishes else [])

        return JsonResponse({'wish_list':result}, status = 200)
