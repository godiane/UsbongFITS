# -*- coding: utf-8 -*-
from django.conf.urls.defaults import patterns, url

urlpatterns = patterns('fitsapp.upload.views',
    url(r'^search/', 'upload_search', name='upload_search'),
    url(r'^locate/', 'locate', name='locate'),
    url(r'^vote/', 'vote', name='vote'),
    url(r'^download/', 'list_download', name='list_download'),
    url(r'^json/', 'send_json', name='send_json'),
    #url(r'^edit/', 'upload_edit', name='upload_edit'),
    #url(r'^edit/([a-zA-Z0-9]{2})/$', 'upload_edit', name='upload_edit'),
    url(r'^edit/(?P<editee>\w+)/$', 'upload_edit', name='upload_edit'),
    url(r'^delete/(?P<deletee>\w+)/$', 'upload_delete', name='upload_delete'),
    url(r'^$', 'upload', name='upload'),
)