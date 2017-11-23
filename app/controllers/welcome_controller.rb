require 'json'

class WelcomeController < ApplicationController
  
  include MoviesHelper
  include TvHelper
  
  def home
    @popular = popular(false)
    @now_playing = now_playing(false)
    @popular_tv = popular_tv(false)
    @on_the_air = on_the_air(false)
    @rmovies = JSON.parse(RestClient.get("https://www.reddit.com/r/movies/hot.json"))
    @rtelevision = JSON.parse(RestClient.get("https://www.reddit.com/r/television/hot.json"))
  end
  
  def about
  end
end