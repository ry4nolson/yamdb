class TvController < ApplicationController
  include TvHelper
  
  def index
    @popular = popular_tv(false)
    @on_the_air = on_the_air(false)
  end
  
  def show
    id = params[:id]
    @show = JSON.parse($tmdb["tv/#{id}?api_key=#{$key}"].get)
    
    @hero = "https://image.tmdb.org/t/p/w1280/#{@show['backdrop_path']}"
    @poster = "https://image.tmdb.org/t/p/w500/#{@show['poster_path']}"
    
    @similar = JSON.parse($tmdb["tv/#{id}/similar?api_key=#{$key}"].get)
    @videos = JSON.parse($tmdb["tv/#{id}/videos?api_key=#{$key}"].get)
    @images = JSON.parse($tmdb["tv/#{id}/images?api_key=#{$key}"].get)
    
    credits = JSON.parse($tmdb["tv/#{id}/credits?api_key=#{$key}"].get)
    @cast = credits["cast"]
    @crew = credits["crew"]
  end
end
