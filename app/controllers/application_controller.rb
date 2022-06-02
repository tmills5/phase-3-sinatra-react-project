class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/reviews" do
    @reviews=Review.all
    @reviews.to_json
    
  end

end
