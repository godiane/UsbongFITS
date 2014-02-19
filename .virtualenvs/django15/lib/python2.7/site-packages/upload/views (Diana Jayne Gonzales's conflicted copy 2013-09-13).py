# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect
from django.http import HttpResponse
from django.core.urlresolvers import reverse
from django.conf import settings
from django.contrib import messages

from fitsapp.upload.models import Document
from fitsapp.upload.forms import DocumentForm
from fitsapp.upload.forms import DocumentSearchForm

from StringIO import StringIO

import os, mimetypes, urllib

def upload_search(request):
    
    # Handle search
    if request.method == 'GET':
        form = DocumentSearchForm(request.GET)
        if form.is_valid():
            query = form.cleaned_data['query']
            messages.info(request, 'Search query: ' + query)
        else:
            query = '';
    else:
        form = DocumentSearchForm() # A empty, unbound form
        
    # Load documents for the list page
    if query:
        documents = Document.objects.filter(docfile__contains=query)
    else:
        documents = Document.objects.all()
    # Render list page with the documents and the form
    return render_to_response(
        'upload/list.html',
        {'documents': documents, 'form': form},
        context_instance=RequestContext(request)
    )

def locate(request):
    
    # Handle search
    if request.method == 'GET':
        form = DocumentLocateForm(request.GET)
        if form.is_valid():
            location = form.cleaned_data['location']
        else:
            location = '';
			messages.error(request, 'Invalid utree/xml file.')
    else:
        form = DocumentLocateForm() # A empty, unbound form
        
    # Download document
    if location:
        document = Document.objects.get(docfile=location).update(F('download_count') + 1)
		document.save()
    else:
		messages.error(request, 'utree/xml file not found.')
		
    utree = StringIO(file(document.docfile.path, "rb").read())
    mimetype = mimetypes.guess_type(os.path.basename(document.docfile.name))[0]

    # Render list page with the documents and the form
    return HttpResponse(utree.read(), mimetype=mimetype)
	
def upload(request):
    # Handle file upload
    if request.method == 'POST':
        form = DocumentForm(request.POST, request.FILES)
        if form.is_valid() and request.FILES['docfile'].name.lower().endswith(('.xml', '.utree')):

            newdoc = Document(docfile = request.FILES['docfile'], uploader = request.user, description = 'Test description.')
            newdoc.save()
            #if os.path.getsize(request.FILES['docfile']) > settings.MAX_UPLOAD_SIZE:
            #    messages.error(request, 'File size is too big.')
            #else:
            #    newdoc.save()

        else:
            messages.error(request, 'File type is not supported.')

        # Redirect to the document list after POST
        return HttpResponseRedirect(reverse('fitsapp.upload.views.upload'))

    else:
        form = DocumentForm() # A empty, unbound form

    # Load documents for the list page
    documents = Document.objects.filter(uploader=request.user)

    # Render list page with the documents and the form
    return render_to_response(
        'upload/list.html',
        {'documents': documents, 'form': form},
        context_instance=RequestContext(request)
    )