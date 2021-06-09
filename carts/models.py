from django.db import models
from users.models import User

class Cart(models.Model):
    user        = models.ForeignKey(User, on_delete=models.CASCADE)
    option_type = models.CharField(max_length=45)
    option_id   = models.IntegerField()
    count       = models.IntegerField()

    class Meta:
        db_table = 'carts'