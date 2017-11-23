class TvController < ApplicationController
  include TvHelper
  
  def index
    @popular = popular(false)
    @on_the_air = on_the_air(false)
  end
end
