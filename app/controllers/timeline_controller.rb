class TimelineController < ApplicationController
  def index
  	@tweets = current_user.tweets.order('created_at DESC').includes(:user)
  end
end
