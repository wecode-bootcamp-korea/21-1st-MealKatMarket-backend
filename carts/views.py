import json, jwt, requests

from django.http      import JsonResponse
from django.views     import View
from django.db.models import Q

from users.utils     import login_decorator
from .models         import Cart

class CartView(View):
    @login_decorator
    def post(self, request):
        data = json.loads(request.body)

        user = request.users

        for food_data in data:
            
            food_count = 0

            if Cart.objects.filter(
                Q(user        = user)&
                Q(option_type = food_data['option_type'])&
                Q(option_id   = food_data['option_id'])).exists():

                food = Cart.objects.get(
                    Q(user        = user)&
                    Q(option_type = food_data['option_type'])&
                    Q(option_id   = food_data['option_id']))
                food_count = food.count

            Cart.objects.update_or_create(
                user        = user,
                option_type = food_data['option_type'],
                option_id   = food_data['option_id'],
                defaults    = {"count" : food_data['count'] + food_count})
            
        return JsonResponse({'message':'SUCCESS'}, status=201)
