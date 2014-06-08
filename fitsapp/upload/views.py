# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect
from django.http import HttpResponse
from django.core.urlresolvers import reverse
from django.contrib import messages

from fitsapp.upload.models import Document, Vote, Download
from fitsapp.upload.forms import DocumentForm, DocumentSearchForm, DocumentLocateForm, DocumentVoteForm, DocumentEditForm

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.core.servers.basehttp import FileWrapper
import json as simplejson

from fitsapp import settings

import os, mimetypes

def list_download(request):
    # Load downloads for the list page
    downloads = Download.objects.filter(downloader=request.user)
    form = DocumentSearchForm()
    paginator = Paginator(downloads, 10) # Show 10 downloads per page

    page = request.GET.get('page')
    try:
        downloads = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        downloads = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        downloads = paginator.page(paginator.num_pages)

    # Render list page with the downloads and the form
    return render_to_response(
        'upload/downloads.html',
        {'downloads': downloads, 'form': form},
        context_instance=RequestContext(request)
    )

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

    paginator = Paginator(documents, 10) # Show 10 documents per page

    page = request.GET.get('page')
    try:
        documents = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        documents = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        documents = paginator.page(paginator.num_pages)

    # Render list page with the documents and the form
    return render_to_response(
        'upload/list.html',
        {'documents': documents, 'form': form},
        context_instance=RequestContext(request)
    )

def locate(request):
    # Handle locate
    if request.method == 'GET':
        form = DocumentLocateForm(request.GET)
        if form.is_valid():
            # remove first 3 and last 3 characters of location,
            # which is a randomized string
            location = form.cleaned_data['location'][3:-3]
        else:
            location = ''
            messages.error(request, 'Invalid utree/xml file.')
    else:
        form = DocumentLocateForm() # A empty, unbound form

    # Download document
    if location:
        document = Document.objects.get(id=location)
        if (document):
            # Prepare response file to be downloaded
            path = '/home/usbong/fitsapp/static/media/'
            filename = path + document.docfile.name
            utree = FileWrapper(open(filename))
            mimetype = mimetypes.guess_type(os.path.basename(filename))[0]
            response = HttpResponse(utree, mimetype=mimetype)
            response['Content-Length']      = os.path.getsize(filename)
            response['Content-Disposition'] = "attachment; filename=%s"%document.docfile.name.rpartition('/')[2]

            # Update count
            document.download_count += 1
            document.save()
            newdownload = Download(document = document, downloader = document.uploader)
            newdownload.save()
            return response
        else:
		    messages.error(request, 'utree/xml file ' + location + ' not found.')
    else:
		messages.error(request, 'utree/xml file is invalid.')

def upload(request):
    # Handle file upload
    if request.method == 'POST':
        form = DocumentForm(request.POST, request.FILES)
        if form.is_valid() == 0:
            messages.error(request, 'Invalid input - you might have forgotten to attach an .xml or .utree file. Please try again.')
        elif form.is_valid() and request.FILES['docfile'].name.lower().endswith(('.xml', '.utree')) == 0:
            messages.error(request, 'File type is not supported. Please upload only .xml or .utree files.')
        elif form.is_valid() and request.FILES['docfile'].size > int(settings.MAX_UPLOAD_SIZE):
            messages.error(request, 'File size for .xml or .utree files should be 3MB or less.')
        else:
            newdoc = Document(docfile = request.FILES['docfile'], uploader = request.user, description = request.POST.get('docdesc'))
            newdoc.save()
            messages.info(request, 'You have uploaded ' + newdoc.docfile.name.split('/')[-1] + '.')


        # Redirect to the document list after POST
        return HttpResponseRedirect(reverse('fitsapp.upload.views.upload'))

    else:
        documents = Document.objects.filter(uploader=request.user)
        form = DocumentForm() # A empty, unbound form

    # Load documents for the list page
    #if form.is_valid():
    #    documents = Document.objects.filter(uploader=request.user)
    #else:
    #    documents = Document.objects.all()

    paginator = Paginator(documents, 10) # Show 10 documents per page

    page = request.GET.get('page')
    try:
        documents = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        documents = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        documents = paginator.page(paginator.num_pages)

    # Render list page with the documents and the form
    return render_to_response(
        'upload/list.html',
        {'documents': documents, 'form': form},
        context_instance=RequestContext(request)
    )

def upload_edit(request, editee):
    if request.method == 'POST':
        document = Document.objects.get(id=editee)
        to_update = DocumentEditForm(request.POST, request.FILES, instance=document)
        to_update.save()
        messages.info(request, 'You have edited ' + document.docfile.name.split('/')[-1] + '.')

        documents = Document.objects.all()
        paginator = Paginator(documents, 10) # Show 10 documents per page
        page = request.GET.get('page')
        try:
            documents = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            documents = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            documents = paginator.page(paginator.num_pages)

        form = DocumentForm()
        # Render list page with the documents and the form
        # return render_to_response(
        #     'upload/list.html',
        #     {'documents': documents, 'form': form},
        #     context_instance=RequestContext(request)
        # )

        return HttpResponseRedirect(reverse('fitsapp.upload.views.upload_search'))
    else:
        document = Document.objects.get(id=editee)
        form = DocumentEditForm(instance=document)
        # Render list page with the documents and the form
        return render_to_response(
            'upload/edit.html',
            {'document': document, 'form': form},
            context_instance=RequestContext(request)
        )

def upload_delete(request, deletee):
    document = Document.objects.get(id=deletee)
    document.delete()
    messages.info(request, 'You have deleted ' + document.docfile.name.split('/')[-1] + '.')
    documents = Document.objects.all()
    paginator = Paginator(documents, 10) # Show 10 documents per page
    page = request.GET.get('page')
    try:
        documents = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        documents = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        documents = paginator.page(paginator.num_pages)

    form = DocumentForm()
    # Render list page with the documents and the form
    # return render_to_response(
    #     'upload/list.html',
    #     {'documents': documents, 'form': form},
    #     context_instance=RequestContext(request)
    # )
    return HttpResponseRedirect(reverse('fitsapp.upload.views.upload_search'))

def vote(request):
    # Handle locate
    if request.method == 'GET':
        form = DocumentVoteForm(request.GET)
        if form.is_valid():
            # remove first 3 and last 3 characters of location,
            # which is a randomized string
            votee = form.cleaned_data['votee'][3:-3]
            verdict = form.cleaned_data['verdict']
        else:
            votee = ''
            verdict = ''
            messages.error(request, 'Invalid vote.')
    else:
        form = DocumentVoteForm() # A empty, unbound form

    # Download document
    if votee and verdict:
        document = Document.objects.get(id=votee)
        voted = Vote.objects.filter(voter=request.user, document=document)
        if (document):
            if (voted):
                messages.error(request, 'You have already voted for this document.')
            else:
                if (verdict == 'boo'):
                    # Update upvote
                    document.down_vote -= 1
                    document.save()
                elif (verdict == 'yeah'):
                    # Update upvote
                    document.up_vote += 1
                    document.save()
                newvote = Vote(document = document, voter = request.user)
                newvote.save()
                messages.info(request, 'You have voted ' + document.docfile.name.split('/')[-1] + '. Thanks for voting!')
                        # Redirect to the document list after POST
            return HttpResponseRedirect(reverse('fitsapp.upload.views.upload'))
        else:
            messages.error(request, 'Invalid vote.')
    else:
        messages.error(request, 'Invalid vote.')

    documents = Document.objects.all()
    paginator = Paginator(documents, 10) # Show 10 documents per page
    page = request.GET.get('page')
    try:
        documents = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        documents = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        documents = paginator.page(paginator.num_pages)

    # Render list page with the documents and the form
    return render_to_response(
        'upload/list.html',
        {'documents': documents, 'form': form},
        context_instance=RequestContext(request)
    )

def send_json(request):
    documents = Document.objects.all()
    results = []
    for document in documents:
        results.append({
            'id': document.id,
            'description': document.description,
            'up_vote': document.up_vote,
            'down_vote': document.down_vote,
            'docfile': 'http://usbong.pythonanywhere.com/static/media/' + document.docfile.name,
            'uploader': document.uploader.id,
            #'download_count': document.download_count,
            'date_uploaded': document.docfile.name.split('/')[1] + '-' + document.docfile.name.split('/')[2] + '-' + document.docfile.name.split('/')[3],
        })
    return HttpResponse(simplejson.dumps(results), mimetype='application/json')

