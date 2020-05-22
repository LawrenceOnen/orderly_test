from django.shortcuts import render
from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from rest_framework import permissions
from backoffice.webapp.serializers import UserSerializer, GroupSerializer

# Create your views here.
# ViewSets allows us to neatly organise the vew logic instead of spliting them into different views.
class UserViewSet(viewsets.ModelViewSet):
    #API endpoint that allows users to be viewed or edited
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]


class GroupViewSet(viewsets.ModelViewSet):
    #API endpoint that allows groups to be viewed or edited
    queryset = User.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAuthenticated]