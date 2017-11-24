class PersonController < ApplicationController
  
  include PersonHelper
  
  def show
    id = params[:id]
    
    @person = JSON.parse($tmdb["person/#{id}?api_key=#{$key}"].get)
    
    @portrait = "https://image.tmdb.org/t/p/w500/#{@person['profile_path']}"
    @portrait = "https://image.tmdb.org/t/p/original/#{@person['profile_path']}"
    
    @images = JSON.parse($tmdb["person/#{id}/images?api_key=#{$key}"].get)
  end
end
