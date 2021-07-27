from django.db.models import fields
from rest_framework import serializers
from tac.models import Client, Ticket

class ClientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = ['client_id', 'client_name', 'client_status', 'id_cola']


class TicketSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ticket
        fields = ['cola_id', 'cola_name', 'cola_time']