require 'date'

class MoviesController < ApplicationController

  def index
    popular(false)
    now_playing(false);
  end

  def show
    id = params[:id]
    @movie = JSON.parse($tmdb["movie/#{id}?api_key=#{$key}"].get)
  
    @hero = "https://image.tmdb.org/t/p/w1280/#{@movie['backdrop_path']}"
    @poster = "https://image.tmdb.org/t/p/w500/#{@movie['poster_path']}"
    
    credits = JSON.parse($tmdb["movie/#{id}/credits?api_key=#{$key}"].get)
    @cast = credits["cast"]
    @crew = credits["crew"]
    
    @reviews = JSON.parse($tmdb["movie/#{id}/reviews?api_key=#{$key}"].get)
    @videos = JSON.parse($tmdb["movie/#{id}/videos?api_key=#{$key}"].get)
    @similar = JSON.parse($tmdb["movie/#{id}/similar?api_key=#{$key}"].get)
    
    @images = JSON.parse($tmdb["movie/#{id}/images?api_key=#{$key}"].get)
  end
  
  def popular(render = true) 
    @popular = JSON.parse($tmdb["movie/popular?api_key=#{$key}"].get)
    render 'index' if render
  end
  
  def now_playing(render = true) 
    @now_playing = JSON.parse($tmdb["movie/now_playing?api_key=#{$key}"].get)
    render 'index' if render
  end
  
  def get_year(date)
    Date.parse(date).year
  end
  
  def format_time(length)
    if length > 60
      "#{length.to_i / 60}h #{length % 60}m"
    else
      "#{length}m"
    end
  end
  helper_method :get_year, :format_time
end

