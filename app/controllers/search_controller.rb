class SearchController < ApplicationController
  def index
    @q = params[:q]
    
    @movies = JSON.parse($tmdb["/search/movie?query=#{@q}&include_adult=false&api_key=#{$key}"].get)["results"]
    @shows = JSON.parse($tmdb["/search/tv?query=#{@q}&api_key=#{$key}"].get)["results"]
    @people = JSON.parse($tmdb["/search/person?query=#{@q}&api_key=#{$key}"].get)["results"]
  end
  
  def autocomplete
    @q = params[:q]
    
    if @q.nil? || @q.empty?
      render :json => []
      return
    end
    
    @search = JSON.parse($tmdb["/search/multi?query=#{@q}&include_adult=false&api_key=#{$key}"].get)["results"]
    render :json => @search
  end
end
