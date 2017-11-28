class TvController < ApplicationController
  include TvHelper
  
  def index
    popular(false)
    on_the_air(false)
    top_rated(false)
    
    @list = [@popular_tv, @on_the_air, @top_rated_tv]
  end
  
  def show
    id = params[:id]
    @show = JSON.parse($tmdb["tv/#{id}?api_key=#{$key}&append_to_response=seasons,episodes,reviews,videos,similar,images,credits"].get)
    
    @hero = "https://image.tmdb.org/t/p/w1280/#{@show['backdrop_path']}"
    @poster = "https://image.tmdb.org/t/p/w500/#{@show['poster_path']}"
    
    @seasons= @show["seasons"]
    
    @seasons.each do |season|
      season["episodes_list"] = JSON.parse($tmdb["tv/#{id}/season/#{season["season_number"]}?api_key=#{$key}"].get)
    end
    
    @videos = @show["videos"]
    @similar = @show["similar"]
    @images = @show["images"]
    
    credits = @show["credits"]
    @cast = credits["cast"].sort_by { |cast| cast["order"] }
    @crew = credits["crew"]
  end
  
  def genre
    id = params[:id]
  end
  
  def self.pretty_url(show)
    "/tv/#{show["id"]}-" + "#{show["name"] || show["original_title"]}".parameterize
  end
  
  helper_method :pretty_url
end
