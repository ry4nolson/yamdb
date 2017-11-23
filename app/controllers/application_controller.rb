require 'facebook_wall'
require 'rest-client'
require 'json'
require 'dotenv'
require 'redcarpet'
require 'simple-rss'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  Dotenv.load
  $tmdb = RestClient::Resource.new('https://api.themoviedb.org/3')
  $key = ENV['API_V3']
  
  $markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
end
