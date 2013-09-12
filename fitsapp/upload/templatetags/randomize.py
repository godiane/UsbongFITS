import string
import random
from django import template
from django.template.defaultfilters import stringfilter

register = template.Library()

# creates 3 random characters, helper for randomize stringfilter
def id_generator(size=3, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for x in range(size))

# creates 3 random characters before and after given string
@register.filter(name='randomize')
@stringfilter
def randomize(str):
    return id_generator() + str + id_generator()

