module PersonHelper
  def popular_people(render = true) 
    @popular_people = ApplicationHelper::get "person/popular?api_key=#{$key}"
    render 'index' if render
    
    @popular_people
  end
end
