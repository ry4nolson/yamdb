module MoviesHelper
  
  def popular(renderView = true) 
    page = params[:p] || 1
    @popular = ApplicationHelper::get "movie/popular?page=#{page}"
    @popular["heading"] = "Popular Movies"
    if renderView
      @paging = true;
      @list = [@popular]
      render 'index'
    end
    
    @popular
  end
  
  def now_playing(renderView = true) 
    page = params[:p] || 1
    @now_playing = ApplicationHelper::get "movie/now_playing?page=#{page}"
    @now_playing["heading"] = "In Theatres Now"
    if renderView
      @paging = true;
      @list = [@now_playing]
      render 'index'
    end
    
    @now_playing
  end
  
  def upcoming(renderView = true) 
    page = params[:p] || 1
    @upcoming = ApplicationHelper::get "movie/upcoming?page=#{page}"
    @upcoming["heading"] = "Upcoming Movies"
    if renderView
      @paging = true;
      @list = [@upcoming]
      render 'index'
    end
    
    @upcoming
  end
  
  def top_rated(renderView = true) 
    page = params[:p] || 1
    @top_rated = ApplicationHelper::get "movie/top_rated?page=#{page}"
    @top_rated["heading"] = "Top Rated Movies"
    if renderView
      @paging = true;
      @list = [@top_rated]
      render 'index'
    end
    
    @top_rated
  end
  
  def genre(renderView = true)
    id = params[:id]
    page = params[:p] || 1
    
    url = id.split("-")
    id = url.shift
    genreName = url.join(" ")
    
    @genre_movies = ApplicationHelper::get "discover/movie?with_genres=#{id}&page=#{page}"
    @genre_movies["heading"] = genreName
    if renderView
      @paging = true;
      @list = [@genre_movies]
      render 'index'
    end
    
    @genre_movies
  end
end
