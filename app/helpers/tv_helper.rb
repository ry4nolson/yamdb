module TvHelper
  def popular_tv(render = true) 
    @popular = JSON.parse($tmdb["tv/popular?api_key=#{$key}"].get)
    render 'index' if render
    
    @popular
  end
  
  def on_the_air(render = true) 
    @on_the_air = JSON.parse($tmdb["tv/on_the_air?api_key=#{$key}"].get)
    render 'index' if render
    @on_the_air
  end
  
  def top_rated(render = true) 
    @top_rated = JSON.parse($tmdb["tv/top_rated?api_key=#{$key}"].get)
    render 'index' if render
    @top_rated
  end
end
