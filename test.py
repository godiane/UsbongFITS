import json
import cookielib
import socket
import urllib
import urllib2
import httplib

try:
    params = urllib.urlencode({'username' : 'diane', 'password' : 'p588w02k'})
    response = urllib2.urlopen('http://usbong3.appspot.com', params)
    server = httplib.HTTPConnection('usbong3.appspot.com:80')
    headers = {"Content-type": "application/x-www-form-urlencoded", "Accept": "text/plain"}
    server.request('POST', '/json', params, headers)
    response = server.getresponse()
    contents = response.read()
except urllib2.HTTPError, error:
    contents = error.read()

print contents
