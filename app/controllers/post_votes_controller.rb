class PostVotesController < ApplicationController
	def create
		# finds the post, given an url with right format
		# '/post_votes/:id'
		post = Post.find(params[:id])

		#new_vote = PostVote.new()
		new_vote = PostVote.new(:user => current_user, :post => post)
		# new_vote = PostVote.new(:user_id => current_user.id, :post_id => post.id)

		if new_vote.save
			# this single line already did the view for us
			render json: new_vote, status: 201
		end
	end
end
