from django.db import models

from users.models    import User
from products.models import Food

class Wish(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    food = models.ForeignKey(Food, on_delete=models.CASCADE)

    class Meta:
        db_table = 'wishes'
    
