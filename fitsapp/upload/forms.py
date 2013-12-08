# -*- coding: utf-8 -*-
from django import forms
from fitsapp.upload.models import Document

class DocumentForm(forms.Form):
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

class DocumentSearchForm(forms.Form):
    query = forms.CharField(
        label='Search'
    )

class DocumentLocateForm(forms.Form):
    location = forms.CharField(
        label='Download URL'
    )

class DocumentVoteForm(forms.Form):
    votee = forms.CharField(
        label='Votee'
    )
    verdict = forms.CharField(
        label='Verdict'
    )

class DocumentJsonForm(forms.Form):
    row = forms.CharField(
        label='Row'
    )

class DocumentEditForm(forms.ModelForm):
    class Meta:
        model = Document
        fields = ['id', 'description']

