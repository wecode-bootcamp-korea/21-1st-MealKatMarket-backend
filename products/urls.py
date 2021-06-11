from django.urls import path

from .views import FoodView

urlpatterns = [
   path('/<int:food_id>',FoodView.as_view())
]
