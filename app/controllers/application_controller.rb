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
  $key = ENV['API_V3']
  
  $markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  
  $genres = Hash.new
  $genres["movies"] = ApplicationHelper::get("genre/movie/list")
  $genres["tv"] = ApplicationHelper::get("genre/movie/list")
end
