class TvController < ApplicationController
  include TvHelper
  
  def index
    @popular = popular_tv(false)
    @on_the_air = on_the_air(false)
  end
  
  def show
    id = params[:id]
    @show = JSON.parse($tmdb["tv/#{id}?api_key=#{$key}&append_to_response=reviews,videos,similar,images,credits"].get)
    
    @hero = "https://image.tmdb.org/t/p/w1280/#{@show['backdrop_path']}"
    @poster = "https://image.tmdb.org/t/p/w500/#{@show['poster_path']}"
    
    @videos = @show["videos"]
    @similar = @show["similar"]
    @images = @show["images"]
    
    credits = @show["credits"]
    @cast = credits["cast"]
    @crew = credits["crew"]
  end
end
