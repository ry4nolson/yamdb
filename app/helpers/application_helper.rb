module ApplicationHelper
  def self.get(endpoint, tries = 0)
    
    puts endpoint
    
    if tries > 4
      [].to_json
    end
    
    begin
      if endpoint.include? "?"
        endpoint += "&api_key=#{$key}"
      else
        endpoint += "?api_key=#{$key}"
      end
      
      puts "trying to get #{endpoint}"
    
      resource = JSON.parse(RestClient::Resource.new('https://api.themoviedb.org/3')[endpoint].get)
      
      puts resource
      
      resource
    rescue RestClient::ExceptionWithResponse => e
      if e.response.code == 429
        sleep(e.response.headers[:retry_after].to_f + 0.5)
        get(endpoint, tries + 1)
      end
    end
  end
end
