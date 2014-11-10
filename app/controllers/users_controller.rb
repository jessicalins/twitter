class UsersController < ApplicationController
	def show
		@tweets = current_user.tweets.order('created_at DESC').includes(:user)
	end
end
