class CocktailsController < ApplicationController
    set :default_content_type, 'application/json'
   
    get "/cocktails" do
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
      cocktail_name: params[:cocktail_name],
      category: params[:category],
      image: params[:image],
      glass: params[:glass]
    )
    cocktail.to_json
  end

  patch "/cocktails/:id" do 
    cocktail = Cocktail.find_by_id(params[:id])
    cocktail.update(
      cocktail_name: params[:cocktail_name],
      category: params[:category],
      image: params[:image],
      glass: params[:glass]
      )
    cocktail.save
  end

  delete "/cocktails/:id" do
    cocktail = Cocktail.find_by_id(params[:id])
    cocktail.destroy
  end


end

