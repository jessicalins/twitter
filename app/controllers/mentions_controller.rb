class MentionsController < ApplicationController
  def show
    @user = current_user
    @tweet = Tweet.new
    @tweets = @user.tweet_mentions.order('created_at DESC').page(params[:page])
  end
end
