import urllib2
import urllib

def get_usbong_response(username, password):
	url = 'http://usbong3.appspot.com/json'
	params = {'username' : username, 'password' : password}
	request = urllib2.Request(url, urllib.urlencode(params))
	response = urllib2.urlopen(request)

	html = response.read()
	return html