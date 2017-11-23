class SearchController < ApplicationController
  def index
    @q = params[:q]
    
    @results = JSON.parse($tmdb["/search/multi?query=#{@q}&api_key=#{$key}"].get)
  end
end
