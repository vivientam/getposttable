class Post < ActiveRecord::Base
	belongs_to :user

	has_many :comments

	# regex = regular expression
	URL_REGEX = /https?:\/\/[\S]+/

	# validates :column_name, 
	validates :title, :length => { minimum: 3}, :presence => true
	validates :url, :length => { minimum: 3}, :allow_blank => true, :format => { with: URL_REGEX}

	# validate :spam_free
	validate :post_count

	private

		def spam_free
			# order all the posts reverse chronologically
			# the latest post
			# get the posted time for the latest post
			last_post = Post.order(:created_at).last
			latest_time = last_post.created_at

			# goal: the user can only post after 1 minute
			if Post.any? and latest_time > 1.minute.ago
				# if this is true, the last post was made in less 1 minute ao, so please raise an error
				self.errors.add(:base, "Cannot post within 1 minute")
			end
		end

		def post_count
			count = Post.count
			
			if count > 20
				self.errors.add(:base, "Cannot post more than 20 posts")
			end
		end
end	
