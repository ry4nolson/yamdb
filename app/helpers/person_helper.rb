module PersonHelper
  def popular_people(render = true) 
    @popular_people = JSON.parse($tmdb["person/popular?api_key=#{$key}"].get)
    render 'index' if render
    
    @popular_people
  end
end
