require 'json'

class WelcomeController < ApplicationController
  
  include MoviesHelper
  
  def home
    @popular = popular(false)
    @now_playing = now_playing(false)
    @posts = JSON.parse(RestClient.get("https://www.reddit.com/r/movies/hot.json"))
  end
  
  def about
  end
end