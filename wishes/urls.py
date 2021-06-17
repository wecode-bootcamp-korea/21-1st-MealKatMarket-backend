from django.urls import path

from .views import WishView

urlpatterns = [
   path('',WishView.as_view()),
   path('/<int:food_id>', WishView.as_view())
]
