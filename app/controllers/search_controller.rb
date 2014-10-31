class SearchController < ApplicationController
	def index
		@users = User.where("name like ?", params[:query])
	end

	def follow
		user = User.find(params[:id])
		user.user_followers.create(follower_id: current_user.id)

		if user.save
			flash[:notice] = 'Now you are following #{user.name}!'
      redirect_to user_path current_user
    else
      flash[:error] = 'Try again!'
    end

	end
end
