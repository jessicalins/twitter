class TweetsController < ApplicationController
  respond_to :html, :js
  before_action :set_tweets

  def index
    @tweets = current_user.tweets
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    @tweet.author = current_user.name

    if @tweet.save
      respond_with @tweet, location: user_path(current_user)
    else
      flash[:error] = 'Try again!'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    respond_with @tweet, location: user_path(current_user)
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_tweets
    @all_tweets = Tweet.where(user_id: [[current_user.id] | current_user.following_ids]).order('created_at DESC')
  end

  def find_new_tweets
    @last_tweet = @all_tweets.first
    @new_tweets = Tweet.where("created_at > ?", @last_tweet.created_at) 
  end
end
