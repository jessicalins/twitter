class UsersController < ApplicationController
	def show
		@user = current_user
		@tweets = @user.tweets.order('created_at DESC').includes(:user)
		@tweet = Tweet.new		
	end
end
