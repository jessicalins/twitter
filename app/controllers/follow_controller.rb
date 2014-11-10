class FollowController < ApplicationController
	def following
		@user = User.find(params[:id])
		@following = @user.following
	end

	def followers
		@user = User.find(params[:id])
		@followers = @user.followers
	end
end
