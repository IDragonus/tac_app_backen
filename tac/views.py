from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from rest_framework.serializers import Serializer

# import models and serializers here!

from .models import Client, Ticket
from .serializers import ClientSerializer, TicketSerializer

# Create your views here.

@csrf_exempt
def List_Client(request):
    if request.method == 'GET':
        client = Client.objects.all()
        serializer = ClientSerializer(client, many=True)
        return JsonResponse(serializer.data, safe=False)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = ClientSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)


@csrf_exempt
def Details_Client(request, pk):
    try:
        client = Client.objects.get(pk=pk)
    except Client.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = ClientSerializer(client)
        return JsonResponse(serializer.data)

    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = ClientSerializer(client, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        return JsonResponse(serializer.errors, status=400)

    elif request.method == 'DELETE':
        client.delete()
        return HttpResponse(status=204)


@csrf_exempt
def colaApi(request):
    if request.method == 'GET':
        ticket = Ticket.objects.all()
        serializer = TicketSerializer(ticket, many=True)
        return JsonResponse(serializer.data, safe=False)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = TicketSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)


@csrf_exempt
def detailsColaApi(request, pk):
    try:
        ticket = Ticket.objects.get(pk=pk)
    except Ticket.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = TicketSerializer(ticket)
        return JsonResponse(serializer.data)

    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = TicketSerializer(ticket, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        return JsonResponse(serializer.erros, status=400)

    elif request.method == 'DELETE':
        ticket.delete()
        return HttpResponse(status=204)