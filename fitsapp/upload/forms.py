# -*- coding: utf-8 -*-
from django import forms
from fitsapp.upload.models import Document
from django.forms import Form, ModelForm, Textarea

class DocumentForm(Form):
    docfile = forms.FileField(
        label='Select a file',
        help_text='max. 3 megabytes'
    )
    docdesc = forms.CharField(
        label='Description',
        max_length=300,
        help_text='300 characters max.',
        widget=forms.Textarea
    )

class DocumentSearchForm(Form):
    query = forms.CharField(
        label='Search'
    )

class DocumentLocateForm(Form):
    location = forms.CharField(
        label='Download URL'
    )

class DocumentVoteForm(Form):
    votee = forms.CharField(
        label='Votee'
    )
    verdict = forms.CharField(
        label='Verdict'
    )

class DocumentJsonForm(Form):
    row = forms.CharField(
        label='Row'
    )

class DocumentEditForm(ModelForm):
    class Meta:
        model = Document
        fields = ['id', 'description']
        widgets = {
            'description': Textarea(attrs={'cols': 80, 'rows': 20}),
        }
