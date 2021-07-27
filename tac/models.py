from django.db import models
from django.db.models.deletion import CASCADE

# Create your models here.

class Ticket(models.Model):
    cola_id = models.AutoField(primary_key=True)
    COLA_LIST = (
        ('cola 1', 'cola 1'),
        ('cola 2', 'cola 2'),
    )
    cola_name = models.CharField(max_length=10, choices=COLA_LIST)
    COLAS_TIME = (
        ('2min', '2min'),
        ('3min', '3min'),
    )
    cola_time = models.CharField(max_length=10, choices=COLAS_TIME)


class Client(models.Model):
    client_id = models.AutoField(primary_key=True)
    client_name = models.CharField(max_length=100)
    client_status = models.CharField(max_length=20, default='No Atendido')
    id_cola = models.ForeignKey(Ticket, on_delete=CASCADE)