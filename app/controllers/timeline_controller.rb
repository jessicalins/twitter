class TimelineController < ApplicationController
  def index
  	@tweets = []
  	current_user.following.each { |following| @tweets << following.tweets }
  	@tweets << current_user.tweets #procurar como ordenar os tweets
  end
end
