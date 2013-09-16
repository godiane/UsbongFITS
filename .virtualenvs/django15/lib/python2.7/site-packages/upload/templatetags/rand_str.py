import string
import random

def id_generator(size=3, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for x in range(size))

@register.filter(name='randomize')
@stringfilter
def randomize(str):
    return id_generator() + str + id_generator()

