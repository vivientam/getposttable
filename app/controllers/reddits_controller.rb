class RedditsController < ApplicationController
	def index
		#how do I get data from database and put it here??

		#this will store all the reddits in an array into the variable @reddits
		@reddits = Reddit.all
	end

	def new
		@reddit = Reddit.new
	end

	def create
		reddit = Reddit.new(Reddit_params)
		# this goes to the model and check all the validations before it gets saved 
		# if validation passes, then it saves, and it returns true
		# otherwise, it returns false
		if reddit.save
			redirect_to reddits_path
			else
			# if the record doesnt save because it didnt pass the validations
			flash[:message] = Reddit.errors.
			messages[:base]
			
			redirect_to :back
		end
	end			
	# this only show one Reddit
	def show
		# params [:id] will look for the id in the url
		# this basically retrieve the Reddit with a specific id
		@reddit = Reddit.find(params[:id])
	end

	# this is only for internal use.
	private
		def reddit_params
			params.require(:Reddit).
				permit(:title, :comment)
		end
end
