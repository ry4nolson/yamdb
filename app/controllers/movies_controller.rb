require 'date'

class MoviesController < ApplicationController
  include MoviesHelper
  
  def index
    popular(false)
    now_playing(false);
  end

  def show
    id = params[:id]
    @movie = JSON.parse($tmdb["movie/#{id}?api_key=#{$key}&append_to_response=reviews,videos,similar,images,credits"].get)
    
    puts @movie
  
    @hero = "https://image.tmdb.org/t/p/w1280/#{@movie['backdrop_path']}"
    @poster = "https://image.tmdb.org/t/p/w500/#{@movie['poster_path']}"
    @posterfull = "https://image.tmdb.org/t/p/original/#{@movie['poster_path']}"
    
    credits = @movie["credits"]
    #credits = JSON.parse($tmdb["movie/#{id}/credits?api_key=#{$key}"].get)
    @cast = credits["cast"]
    @crew = credits["crew"]
    
    @reviews = @movie["reviews"]
    @videos = @movie["videos"]
    @similar = @movie["similar"]
    @images = @movie["images"]
    #@reviews = JSON.parse($tmdb["movie/#{id}/reviews?api_key=#{$key}"].get)
    #@videos = JSON.parse($tmdb["movie/#{id}/videos?api_key=#{$key}"].get)
    #@similar = JSON.parse($tmdb["movie/#{id}/similar?api_key=#{$key}"].get)
    
    #@images = JSON.parse($tmdb["movie/#{id}/images?api_key=#{$key}"].get)
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

