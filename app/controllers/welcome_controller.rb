class WelcomeController < ApplicationController
  def index
  	@tweets = current_user.tweets
  	@tweet = Tweet.new
  end
end
