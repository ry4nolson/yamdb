require 'json'

class WelcomeController < ApplicationController
  
  include MoviesHelper
  include TvHelper
  
  def home
    popular(false)
    now_playing(false)
    popular_tv(false)
    on_the_air(false)
    
    @rmovies = JSON.parse(RestClient.get("https://www.reddit.com/r/movies/hot.json?limit=6"))
    @rtelevision = JSON.parse(RestClient.get("https://www.reddit.com/r/television/hot.json?limit=6"))
  end
  
  def about
  end
  
  def lity(url)
    if url.match (/youtube|vimeo|imgur/)
      "data-lity"
    end
  end
  
  helper_method :lity
end