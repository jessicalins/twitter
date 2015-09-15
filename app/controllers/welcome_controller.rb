class WelcomeController < ApplicationController
  respond_to :html, :js
  def index
    @tweets = Tweet.where(user_id: [[current_user.id] | current_user.following_ids]).order('created_at DESC').page(params[:page])
    @user = current_user
    @tweet = Tweet.new  
    respond_with @tweets, location: user_path(@user)
  end
end
