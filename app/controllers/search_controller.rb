class SearchController < ApplicationController
	def index
		@users = User.where(name: params[:query])
	end
end
