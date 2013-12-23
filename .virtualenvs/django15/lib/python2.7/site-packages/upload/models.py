# -*- coding: utf-8 -*-
from django.db import models
from allauth import app_settings
from extra import ContentTypeRestrictedFileField

class Document(models.Model):
    docfile = ContentTypeRestrictedFileField(upload_to='documents/%Y/%m/%d', max_upload_size=3145728)
    uploader = models.ForeignKey(app_settings.USER_MODEL)
    description = models.CharField(max_length=300)
    date_uploaded = models.DateField(auto_now_add=True)
    download_count = models.PositiveIntegerField(max_length=10, default=0)
    up_vote = models.PositiveIntegerField(max_length=10, default=0)
    down_vote = models.FloatField(max_length=10, default=0)

class Vote(models.Model):
    document = models.ForeignKey('Document')
    voter = models.ForeignKey(app_settings.USER_MODEL)
    date = models.DateField(auto_now_add=True)

class Download(models.Model):
    document = models.ForeignKey('Document')
    downloader = models.ForeignKey(app_settings.USER_MODEL)
    date = models.DateTimeField(auto_now_add=True)
