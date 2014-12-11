class MarksController < ApplicationController
	def index
		#how do I get data from database and put it here??

		#this will store all the posts in an array into the variable @posts
		@marks = Mark.all
	end
end
