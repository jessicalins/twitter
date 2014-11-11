class TweetsController < ApplicationController
  respond_to :html, :json

	def index
		@tweets = current_user.tweets
  	@tweet = Tweet.new
	end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    @tweet.author = current_user.name

    if @tweet.save
      redirect_to user_path current_user
    else
      flash[:error] = 'Try again!'
    end
  end

  def tweet_params
  	params.require(:tweet).permit(:content)
  end

  def find_new_tweets
    last_tweet = Tweet.last
    new_tweets = Tweet.where("created_at > ?", last_tweet.created_at)
    tweets = Tweet.all
    respond_with tweets
  end
end
