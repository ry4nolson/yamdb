module TvHelper
  def popular_tv(renderView = true) 
    page = params[:p] || 1
    @popular_tv = ApplicationHelper::get "tv/popular?page=#{page}"
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
    @on_the_air = ApplicationHelper::get "tv/on_the_air?page=#{page}"
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
    @top_rated_tv = ApplicationHelper::get "tv/top_rated?page=#{page}"
    @top_rated_tv["heading"] = "Top Rated TV Series"
    if renderView
      @paging = true;
      @list = [@top_rated_tv]
      render 'index'
    end
    @top_rated_tv
  end
  
  
  def genre(renderView = true)
    id = params[:id]
    page = params[:p] || 1
    
    url = id.split("-")
    id = url.shift
    genreName = url.join(" ")
    
    @genre_tv = ApplicationHelper::get "discover/tv/?with_genres=#{id}&page=#{page}"
    @genre_tv["heading"] = genreName
    if renderView
      @paging = true;
      @list = [@genre_tv]
      render 'index'
    end
    
    @genre_tv
  end
end
