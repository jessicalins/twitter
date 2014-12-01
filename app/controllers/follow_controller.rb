class FollowController < ApplicationController
	def following
		@user = User.find_by_username(params[:user_id])
		@following = @user.following
	end

	def followers
		@user = User.find_by_username(params[:user_id])
		@followers = @user.followers
	end

	def follow
		@user = User.find_by_username(params[:user_id])
		@user.user_followers.create(follower_id: current_user.id)
		respond_to do |format|
			format.js { render 'after_follow' }
		end
	end

	def unfollow
		@user = User.find_by_username(params[:user_id])
		UserFollower.where(follower_id: current_user.id, user_id: @user.id).destroy_all
		respond_to do |format|
			format.js { render 'after_follow' }
		end
	end
end
