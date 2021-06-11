from django.urls import path

from .views import FoodlistView

urlpatterns = [
    path('', FoodlistView.as_view()),
]
