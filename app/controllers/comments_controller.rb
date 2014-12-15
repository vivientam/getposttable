class CommentsController <  ApplicationController
	def index
		#how do I get data from database and put it here??

		#this will store all the posts in an array into the variable @posts
		@comments = Comment.all
	end

	def new
		@comment = Comment.new
	end

	def create

		# comment = current_user.comments.new(comment_params)
		comment = current_user.comments.new(comment_params)
		if comment.save
			redirect_to comment.post
		else
			redirect_to :back
		end
	end

	def show
		@comment = Comment.find(params[:id])
	end	

	private
		def comment_params
			params.require(:comment).permit(:post_id, :content)
		end
end