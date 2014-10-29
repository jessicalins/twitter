class TweetsController < ApplicationController
	def index
		@tweets = current_user.tweets
  	@tweet = Tweet.new
	end

  def create
    @tweet = current_user.tweets.new(tweet_params)

    if @tweet.save
      redirect_to user_path current_user
    else
      flash[:error] = 'Try again!'
    end
  end

  def tweet_params
  	params.require(:tweet).permit(:content)
  end
end
