class SearchController < ApplicationController
	def index
		@users = User.where("username like ?", params[:query])
	end
end
