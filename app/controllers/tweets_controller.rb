class TweetsController < ApplicationController
	def index
		@tweets = current_user.tweets
  	@tweet = Tweet.new
	end

  def create
  	@tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tweet }
      else
        format.html { render action: 'new' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def tweet_params
  	params.require(:tweet).permit(:content)
  end
end
