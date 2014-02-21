from django import template
from django.conf import settings
from django.template.defaultfilters import stringfilter
register = template.Library()
import re

# converts youtube URL into embed HTML
# value is url

@register.filter(name='youtube_embed_url')
@stringfilter
def youtube_embed_url(value):
    descriptions = value.split('|')
    replaced_description = ''
    for description in descriptions:
        match = re.search(r'(http|https)\:\/\/www\.youtube\.com\/watch\?v\=(\w*)(\&(.*))?', description)
        if match:
            embed_url = 'http://www.youtube.com/embed/%s' %(match.group(2))
            res = "<iframe width=\"560\" height=\"315\" src=\"%s\" frameborder=\"0\" allowfullscreen></iframe>" %(embed_url)
            #replaced_description = replaced_description + res
            replaced_description = replaced_description + re.sub(r'(http|https)\:\/\/www\.youtube\.com\/watch\?v\=(\w*)(\&(.*))?', res, description)
        else:
            replaced_description = replaced_description + description
    return replaced_description

youtube_embed_url.is_safe = True

@register.filter(name='clean_file_name')
@stringfilter
def clean_file_name(value):
    return value.rpartition('/')[2]

