class PersonController < ApplicationController
  
  include PersonHelper
  
  def show
    id = params[:id]
    
    @person = JSON.parse($tmdb["person/#{id}?api_key=#{$key}&append_to_response=combined_credits,images"].get)
    
    @portrait = "https://image.tmdb.org/t/p/w500/#{@person['profile_path']}"
    @portrait = "https://image.tmdb.org/t/p/original/#{@person['profile_path']}"
    
    @cast = @person["combined_credits"]["cast"]
    @cast_movies = @cast.reject {|a| 
      a["media_type"] != "movie" 
    }.sort_by { |film|
      film["release_date"].split('-') rescue ["0","0","0"]
    }.reverse
    @cast_tv = @cast.reject {|a| 
      a["media_type"] != "tv" 
    }
    
    @crew = @person["combined_credits"]["crew"]
    
    @crew_movies = @crew.reject {|a| 
      a["media_type"] != "movie" 
    }.sort_by { |film|
      film["release_date"].split('-') rescue ["0","0","0"]
    }.reverse
    @crew_tv = @crew.reject {|a|
      a["media_type"] != "tv"
    }
    
    @knownfor = @cast + @crew
    @knownfor.sort_by! { |film| film["vote_count"] }
    @knownfor.reverse!
    
    @person["knownfor"] = @knownfor
    
    @images = @person["images"]
  end
end
