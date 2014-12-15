class PostsController < ApplicationController
	def index
		#how do I get data from database and put it here??

		#this will store all the posts in an array into the variable @posts
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		post = current_user.posts.new(post_params)
		# this goes to the model and check all the validations before it gets saved 
		# if validation passes, then it saves, and it returns true
		# otherwise, it returns false
		if post.save
			redirect_to posts_path
			else
			# if the record doesnt save because it didnt pass the validations
			flash[:message] = post.errors.messages
			
			redirect_to :back
		end
	end			
	# this only show one post
	def show
		# params [:id] will look for the id in the url
		# this basically retrieve the post with a specific id
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	# this is only for internal use.
	private
		def post_params
			params.require(:post).
				permit(:title, :url)
		end
end





