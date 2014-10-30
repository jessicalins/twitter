class TimelineController < ApplicationController
  def index
  	@tweets = []
  	current_user.followers.each { |follower| @tweets << follower.tweets }
  	@tweets << current_user.tweets #procurar como ordenar os tweets
  end
end
