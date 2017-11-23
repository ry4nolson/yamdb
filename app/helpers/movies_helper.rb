module MoviesHelper
  
  def popular(render = true) 
    @popular = JSON.parse($tmdb["movie/popular?api_key=#{$key}"].get)
    render 'index' if render
    
    @popular
  end
  
  def now_playing(render = true) 
    @now_playing = JSON.parse($tmdb["movie/now_playing?api_key=#{$key}"].get)
    render 'index' if render
    @now_playing
  end
end
