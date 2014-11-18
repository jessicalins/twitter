class WelcomeController < ApplicationController
	def index
		@tweets = Tweet.where(user_id: [[current_user.id] | current_user.following_ids]).order('created_at DESC').page(params[:page]).per(10)
  	@user = current_user
		@tweet = Tweet.new		
  end
end
