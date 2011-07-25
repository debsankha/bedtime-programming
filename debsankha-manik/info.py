import cgi
from google.appengine.api import users, xmpp
from google.appengine.ext import webapp
from google.appengine.ext.webapp.util import run_wsgi_app
from google.appengine.ext import db
import datetime
import html

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
		self.response.out.write(html.before)
		mov = db.GqlQuery("SELECT * FROM LikedMovie")

		for movie in mov:
			self.response.out.write("""<li>
							<h3 style="padding:0;margin:4px;">%s</h3>
							<i> at %s</i>
							</li>"""%(movie.Name,movie.date.strftime("%H:%M %h %d, %Y")))
			
		self.response.out.write(html.after)


class XMPPHandler(webapp.RequestHandler):
	def post(self):
		message = xmpp.Message(self.request.POST)
		if message.sender.count('deb5890@gmail.com')==1:
			mov=LikedMovie()
			mov.Name=message.body
			mov.put()
		


application = webapp.WSGIApplication([('/stat', MainPage),('/_ah/xmpp/message/chat/', XMPPHandler)])


def main():
	run_wsgi_app(application)

if __name__ == "__main__":
	main()

