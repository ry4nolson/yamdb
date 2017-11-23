require 'json'

class WelcomeController < ApplicationController
  
  def home
    @response = RestClient.get("https://www.texasbeardcompany.com/api/v1/products", {"x-ac-auth-token" => "2da54d6af991334f1fe97602731899ac"})
    
    @products = JSON.parse(@response.body);
  end
  
  def about
  end
end