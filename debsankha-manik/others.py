from google.appengine.ext import db
from google.appengine.api import users
from google.appengine.ext import webapp
from google.appengine.ext.webapp.util import run_wsgi_app


class MainPage(webapp.RequestHandler):
	def get(self):
		self.redirect('http://debsankha.blogspot.com')


application = webapp.WSGIApplication([('/.*', MainPage)])


def main():
	run_wsgi_app(application)

if __name__ == "__main__":
	main()


