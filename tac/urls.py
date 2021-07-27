from django.urls import path
from tac import views

urlpatterns = [
    path('clients/', views.List_Client),
    path('clients/<int:pk>/', views.Details_Client),
    path('colas/', views.colaApi),
    path('colas/<int:pk>/', views.detailsColaApi)
]