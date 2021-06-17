from django.urls import path

from .views import FoodlistView,FoodView

urlpatterns = [
    path('', FoodlistView.as_view()),
    path('/<int:food_id>',FoodView.as_view())
]