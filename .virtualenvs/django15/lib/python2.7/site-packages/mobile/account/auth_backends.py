from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.tokens import default_token_generator
from django.db.models import Q
from django.utils.http import base36_to_int

from mezzanine.utils.models import get_user_model

from utils import get_usbong_response

import urllib2
import urllib

User = get_user_model()

class AuthenticationBackend(ModelBackend):
    
    def authenticate(self, **kwargs):
        if kwargs:
            username = kwargs.pop("username", None)
            if username:
                username_or_email = Q(username=username) | Q(email=username)
                password = kwargs.pop("password", None)
                try:
                    user = User.objects.get(username_or_email, **kwargs)
                except User.DoesNotExist:
                    auth_response = get_usbong_response(username, password)
                    if auth_response == 'True':
                        user = User(username=username)
                        if password:
                            user.set_password(password)
                        user.is_staff = False
                        user.is_superuser = False
                        user.save()
                        return user
                    else:
                        pass
                else:
                    if user.check_password(password):
                        return user
            else:
                if 'uidb36' not in kwargs:
                    return
                kwargs["id"] = base36_to_int(kwargs.pop("uidb36"))
                token = kwargs.pop("token")
                try:
                    user = User.objects.get(**kwargs)
                except User.DoesNotExist:
                    pass
                else:
                    if default_token_generator.check_token(user, token):
                        return user
