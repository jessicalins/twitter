class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@tweets = @user.tweets.order('created_at DESC').includes(:user)
	end
end
