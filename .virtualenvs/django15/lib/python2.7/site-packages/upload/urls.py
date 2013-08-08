# -*- coding: utf-8 -*-
from django.conf.urls.defaults import patterns, url

urlpatterns = patterns('fitsapp.upload.views',
    url(r'^$', 'upload', name='upload'),
)
