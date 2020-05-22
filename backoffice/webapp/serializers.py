from django.contrib.auth.models import User, Group
from rest_framework import serializers

#for Restful design, hyplink serialisers are recoomended for the relations
#options: Primary key
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class meta:
        model = User
        fields = [
            'url',
            'username',
            'email',
            'groups'
        ]

class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class meta:
        model = Group
        fields = [
            'url',
            'name'
        ]