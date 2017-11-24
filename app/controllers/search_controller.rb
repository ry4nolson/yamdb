class SearchController < ApplicationController
  def index
    @q = params[:q]
    
    
    @movies = JSON.parse($tmdb["/search/movie?query=#{@q}&include_adult=false&api_key=#{$key}"].get)["results"]
    @shows = JSON.parse($tmdb["/search/tv?query=#{@q}&api_key=#{$key}"].get)["results"]
    @people = JSON.parse($tmdb["/search/person?query=#{@q}&api_key=#{$key}"].get)["results"]
  end
end
