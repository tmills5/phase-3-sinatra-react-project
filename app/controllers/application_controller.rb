class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  set :method_override, true

  # Add your routes here

  get "/cocktails" do #-----WORKS!
    @cocktails = Cocktail.all
    @cocktails.to_json
  end

  get "/cocktails/:id" do
    cocktail = Cocktail.find_by_id(params[:id])
    if cocktail
        cocktail.to_json
    else
        { errors: ["Cocktail not found"], status: "Not Found"}.to_json
    end
  end

  post "/cocktails" do #-----WORKS!
    #binding.pry
    cocktail = Cocktail.create(
      name: params[:name],
      category: params[:category],
      image: params[:image],
      glass: params[:glass]
    )
    cocktail.to_json
  end

  # patch "/cocktails/edit/:id" do
  #   cocktail = Cocktail.find_by_id(params[:id])
  #   cocktail.update()
  # end

  delete "/cocktails/:id" do
    cocktail = Cocktail.find_by_id(params[:id])
    cocktail.destroy
  end

end