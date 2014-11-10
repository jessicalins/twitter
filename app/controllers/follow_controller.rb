class FollowController < ApplicationController
	def following
		@user = User.find(params[:user_id])
		@following = @user.following
	end

	def followers
		@user = User.find(params[:user_id])
		@followers = @user.followers
	end
end
