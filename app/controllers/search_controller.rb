class SearchController < ApplicationController

	def search
  if params[:q].nil?
    @rest = []
  else
    @rest = Restaurant.search params[:q]
  end
end
end
