module TvHelper
  def popular_tv(renderView = true) 
    page = params[:p] || 1
    @popular_tv = JSON.parse($tmdb["tv/popular?api_key=#{$key}&page=#{page}"].get)
    @popular_tv["heading"] = "Popular TV Series"
    if renderView
      @paging = true;
      @list = [@popular_tv]
      render 'index'
    end
    
    @popular_tv
  end
  
  def on_the_air(renderView = true) 
    page = params[:p] || 1
    @on_the_air = JSON.parse($tmdb["tv/on_the_air?api_key=#{$key}&page=#{page}"].get)
    @on_the_air["heading"] = "On The Air Now"
    if renderView
      @paging = true;
      @list = [@on_the_air]
      render 'index'
    end
    @on_the_air
  end
  
  def top_rated(renderView = true) 
    page = params[:p] || 1
    @top_rated_tv = JSON.parse($tmdb["tv/top_rated?api_key=#{$key}&page=#{page}"].get)
    @top_rated_tv["heading"] = "Top Rated TV Series"
    if renderView
      @paging = true;
      @list = [@top_rated_tv]
      render 'index'
    end
    @top_rated_tv
  end
end
