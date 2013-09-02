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
    match = re.search(r'(http|https)\:\/\/www\.youtube\.com\/watch\?v\=(\w*)(\&(.*))?', value)
    if match:
        embed_url = 'http://www.youtube.com/embed/%s' %(match.group(2))
        res = "<iframe width=\"142\" height=\"80\" src=\"%s\" frameborder=\"0\" allowfullscreen></iframe>" %(embed_url)
        #return res
        replaced_string = re.sub(r'(http|https)\:\/\/www\.youtube\.com\/watch\?v\=(\w*)(\&(.*))?', res, value)
        return replaced_string
    return value

youtube_embed_url.is_safe = True
