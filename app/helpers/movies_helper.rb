module MoviesHelper
  
  def popular(renderView = true) 
    page = params[:p] || 1
    
    puts page
    @popular = JSON.parse($tmdb["movie/popular?api_key=#{$key}&page=#{page}"].get)
    if renderView
      @paging = true;
      render 'index'
    end
    
    @popular
  end
  
  def now_playing(renderView = true, page = 1) 
    @now_playing = JSON.parse($tmdb["movie/now_playing?api_key=#{$key}&page=#{page}"].get)
    if renderView
      @paging = true;
      render 'index'
    end
    
    @now_playing
  end
end
