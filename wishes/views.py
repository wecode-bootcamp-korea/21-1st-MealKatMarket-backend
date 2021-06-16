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
            print('0---0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0--0--0-0-0-')
            food_id = request.GET['food_id']
            user = request.users
            print(user)
            
            food = Food.objects.get(id=food_id)

            #임시 id 객체 가져오기 및 토근에서 user 정보 가져오기 기능 추가
            users = User.objects.all()

            if Wish.objects.filter(user=users[2], food=food_id).exists():
                return JsonResponse({'message':'FOOD INVALID'}, status=400)

            wish = Wish(
                user=users[0],
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
    
    def delete(self, request, food_id):
        try:
            food = Food.objects.get(id=food_id)

            #임시 id 객체 가져오기 및 토근에서 user 정보 가져오기 기능 추가
            users = User.objects.all()
            
            wish = Wish.objects.get(user=users[0], food=food)
            wish.delete()
        
            return JsonResponse({'message':'SUCCESS'}, status=200)
        
        except Food.DoesNotExist:
           return JsonResponse({'message':'NOT EXIST'}, status=404)
    
    # def get(self, request):
    #     try:
            