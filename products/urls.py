from django.urls import path

from .views import FoodlistView,FoodView,WishFoodView

urlpatterns = [
    path('', FoodlistView.as_view()),
    path('/<int:food_id>',FoodView.as_view()),
    path('/wish/<int:food_id>',WishFoodView.as_view())
]