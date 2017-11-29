class SearchController < ApplicationController
  def index
    @q = params[:q]
    
    @movies = ApplicationHelper::get "/search/movie?query=#{@q}&include_adult=false"["results"]
    @shows = ApplicationHelper::get "/search/tv?query=#{@q}"["results"]
    @people = ApplicationHelper::get "/search/person?query=#{@q}"["results"]
  end
  
  def autocomplete
    @q = params[:q]
    
    if @q.nil? || @q.empty?
      render :json => []
      return
    end
    
    @search = ApplicationHelper::get "/search/multi?query=#{@q}&include_adult=false"["results"]
    render :json => @search
  end
end
