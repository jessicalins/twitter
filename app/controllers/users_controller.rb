class UsersController < ApplicationController
  respond_to :html, :js
  def show
    @user = User.find_by_username(params[:id]) 
    if @user
      @tweets = @user.tweets.order('created_at DESC').includes(:user).page(params[:page])
      respond_with @tweets, location: user_path(@user)
    else
      not_found
    end
  end

  def not_found
    render 'erro404'
  end
end
