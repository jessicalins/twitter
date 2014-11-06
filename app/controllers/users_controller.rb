class UsersController < ApplicationController
	def show
		@user = current_user
		@tweets = Tweet.where(user_id: [[current_user.id] | current_user.following_ids]).order('created_at DESC')
		@tweet = Tweet.new		
	end
end
