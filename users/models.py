from django.db import models

class User(models.Model):
    email        = models.EmailField(max_length=50, unique=True)
    password     = models.CharField(max_length=50)
    name         = models.CharField(max_length=20)
    phone_number = models.CharField(max_length=13, unique=True)
    create_at    = models.DateTimeField(auto_now_add=True)
    update_at    = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'users'
