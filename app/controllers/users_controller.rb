class UsersController < ApplicationController
	def index
	end

	def show
		@user = current_user
		@tweets = current_user.tweets
		@tweet = Tweet.new		
	end
end
