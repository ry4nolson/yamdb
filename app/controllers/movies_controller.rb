require 'date'

class MoviesController < ApplicationController
  include MoviesHelper
  
  def index
    popular(false)
    now_playing(false)
    top_rated(false)
    upcoming(false)
    
    @list = [@popular, @now_playing, @top_rated, @upcoming]
  end

  def show
    id = params[:id]
    @movie = JSON.parse($tmdb["movie/#{id}?api_key=#{$key}&append_to_response=reviews,videos,similar,images,credits"].get)
    
    puts @movie
  
    @hero = "https://image.tmdb.org/t/p/w1280/#{@movie['backdrop_path']}"
    @poster = "https://image.tmdb.org/t/p/w500/#{@movie['poster_path']}"
    @posterfull = "https://image.tmdb.org/t/p/original/#{@movie['poster_path']}"
    
    credits = @movie["credits"]
    @cast = credits["cast"]
    @crew = credits["crew"]
    
    @director = @crew.select { |crew| crew["job"] == "Director" }.map { |crew| crew["name"] }
    @producer = @crew.select { |crew| crew["job"].include? "Producer" }.map { |crew| crew["name"] }
    @writer = @crew.select { |crew| crew["job"].include? "Writer" }.map { |crew| crew["name"] }
    
    @reviews = @movie["reviews"]
    @videos = @movie["videos"]
    @similar = @movie["similar"]
    @images = @movie["images"]
  end
  
  def genre
    id = params[:id]
  end
  
  def get_year(date)
    Date.parse(date).year if !date.empty?
  end
  
  def format_time(length)
    if length > 60
      "#{length.to_i / 60}h #{length % 60}m"
    else
      "#{length}m"
    end
  end
  
  def self.pretty_url(movie)
    "/movies/#{movie["id"]}-" + "#{movie["title"] || movie["original_title"]}".parameterize
  end
  helper_method :get_year, :format_time, :pretty_url
end

