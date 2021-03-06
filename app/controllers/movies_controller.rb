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
  
  def genre_list
    
  end

  def show
    id = params[:id]
    @movie = ApplicationHelper::get "movie/#{id}?append_to_response=reviews,videos,similar,images,credits,release_dates"
  
    @hero = "https://image.tmdb.org/t/p/w1280#{@movie['backdrop_path']}"
    @poster = "https://image.tmdb.org/t/p/w500#{@movie['poster_path']}"
    @posterfull = "https://image.tmdb.org/t/p/original#{@movie['poster_path']}"
    
    @release_dates = @movie["release_dates"]
    @us = @release_dates["results"].select { |release| release["iso_3166_1"] == "US" }.first["release_dates"] rescue []

    begin
      if @us && @us.count > 0
        @rating = @us.select { |r| r["certification"] && !r["certification"].empty? }
        @rating = @rating.map { |r| r["certification"] }.uniq.join(", ")
      end
    rescue
      @rating = ""
    end
    
    credits = @movie["credits"]
    @cast = credits["cast"]
    @crew = credits["crew"]
    
    @director = @crew.select { |crew| crew["job"].include? "Director" }.map { |crew| crew["name"] }
    @producer = @crew.select { |crew| crew["job"].include? "Producer" }.map { |crew| crew["name"] }
    @writer = @crew.select { |crew| crew["department"].include? "Writing" }.map { |crew| crew["name"] }
    
    @reviews = @movie["reviews"]
    @videos = @movie["videos"]
    @similar = @movie["similar"]
    @images = @movie["images"]
    
    
    set_meta_tags og: {
      title:    @movie["title"] || @movie["original_title"],
      type:     'movie',
      url:      request.url,
      image:    [@poster, @hero]
    }
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

