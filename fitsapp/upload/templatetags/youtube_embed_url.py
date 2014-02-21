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
    matches = re.findall(r'(http|https)\:\/\/www\.youtube\.com\/watch\?v\=(\w*)(\&(.*))?', value)
    replaced_description = ''
    
    if matches:
        for match in matches:
            embed_url = 'http://www.youtube.com/embed/%s' % match[1]
            res = "<iframe width=\"560\" height=\"315\" src=\"%s\" frameborder=\"0\" allowfullscreen></iframe>" %(embed_url)
            if replaced_description != '':
                replaced_description = re.sub(r'(http|https)\:\/\/www\.youtube\.com\/watch\?v\=' + match[1], res, replaced_description)
                print 'not null: ' + replaced_description
            else:
                replaced_description = replaced_description + re.sub(r'(http|https)\:\/\/www\.youtube\.com\/watch\?v\=' + match[1], res, value)
                print 'null: ' + replaced_description
    else:
        replaced_description = value
    return replaced_description

youtube_embed_url.is_safe = True

@register.filter(name='clean_file_name')
@stringfilter
def clean_file_name(value):
    return value.rpartition('/')[2]

