class UsersController < ApplicationController
	respond_to :html, :js
	def show
		@user = User.find(params[:id])
		@tweets = @user.tweets.order('created_at DESC').includes(:user).page(params[:page])
		respond_with @tweets, location: user_path(@user)
	end
end
