module PersonHelper
  def popular_people(renderView = true) 
    page = params[:p] || 1
    @popular_people = ApplicationHelper::get "person/popular?page=#{page}"
    @popular_people["heading"] = "Popular People"
    if renderView
      @paging = true;
      @list = [@popular_people]
      render 'index'
    end
    
    @popular_people
  end
end
