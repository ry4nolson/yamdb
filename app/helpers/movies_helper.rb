module MoviesHelper
  
  def popular(renderView = true) 
    page = params[:p] || 1
    @popular = JSON.parse($tmdb["movie/popular?api_key=#{$key}&page=#{page}"].get)
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
    @now_playing = JSON.parse($tmdb["movie/now_playing?api_key=#{$key}&page=#{page}"].get)
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
    @upcoming = JSON.parse($tmdb["movie/upcoming?api_key=#{$key}&page=#{page}"].get)
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
    @top_rated = JSON.parse($tmdb["movie/top_rated?api_key=#{$key}&page=#{page}"].get)
    @top_rated["heading"] = "Top Rated Movies"
    if renderView
      @paging = true;
      @list = [@top_rated]
      render 'index'
    end
    
    @top_rated
  end
end
