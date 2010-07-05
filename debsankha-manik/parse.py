import urllib
import re
import simplejson
from BeautifulSoup import BeautifulSoup as soup

class AppURLopener(urllib.FancyURLopener):
	version="""Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.1 (KHTML, like Gecko) Chrome/6.0.437.3 Safari/534.1"""

query = urllib.urlencode([('q','Three colors blue')])
query=query[:2]+'site:imdb.com+'+query[2:]
url = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&%s"%query
search_results = urllib.urlopen(url)
json = simplejson.loads(search_results.read())

result1=json['responseData']['results'][0]['url']

urllib._urlopener = AppURLopener()

page=urllib.urlopen(result1)

doc=page.read()


