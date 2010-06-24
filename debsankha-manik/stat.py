import cgi
from google.appengine.api import users, xmpp
from google.appengine.ext import webapp
from google.appengine.ext.webapp.util import run_wsgi_app
from google.appengine.ext import db
import datetime

def nav_index(n,tot,start):
	if n+start>=tot:
		old=-1
	else :
		old=n+start
	
	if n-5<0:
		new=-1
	else :
		new=n-5

	return old,new

class News(db.Model):
	author = db.StringProperty()
	title=db.StringProperty()
	date=db.StringProperty()
	content = db.TextProperty()	#(multiline=True)
	submission_date = db.DateTimeProperty()
	is_modified=db.BooleanProperty()

class LikedMovie(db.Model):
	Name=db.StringProperty()
	date=db.DateTimeProperty(auto_now_add=True)


class MainPage(webapp.RequestHandler):
	def get(self):
		self.response.out.write("""<html><head><title>Stats</title></head><body>""")
		try:
			mov = db.GqlQuery("SELECT * FROM LikedMovie")
		except:
			mov=[]

		if mov.count()>0:
			for movie in mov:
				self.response.out.write("<p>Liked <h3>%s</h3> <i> at %s</i></p>"%(movie.Name,movie.date))

		else :
			self.response.out.write("Nothing liked yet")

		self.response.out.write("</body></html>")


class XMPPHandler(webapp.RequestHandler):
	def post(self):
		message = xmpp.Message(self.request.POST)
		mov=LikedMovie()
		mov.Name=message.body
		mov.put()
		


application = webapp.WSGIApplication([('/stat', MainPage),('/_ah/xmpp/message/chat/', XMPPHandler)],debug=True)


def main():
	run_wsgi_app(application)

if __name__ == "__main__":
	main()

