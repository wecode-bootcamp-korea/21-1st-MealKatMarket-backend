from django.urls import path

from .views import WishView

urlpatterns = [
   path('/<int:food_id>',WishView.as_view())
]
