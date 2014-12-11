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
		post = Post.new(post_params)
		if post.save
			redirect_to posts_path
		end
	end	
	# this only show one post
	def show
		# params [:id] will look for the id in the url
		# this basically retrieve the post with a specific id
		@post = Post.find(params[:id])
	end

	# this is only for internal use.
	private
		def post_params
			params.require(:post).
				permit(:title, :url)
		end
end



