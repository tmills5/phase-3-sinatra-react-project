class CocktailsController < ApplicationController
    
    #getting all of the cocktails. 
    #returns the cocktail AND the ingredients through the join table
    #that way we see the cocktail, and the actual ingredient-not just the ingredient ID
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

    post "/cocktails" do
        #binding.pry
        cocktail = Cocktail.new(params[:cocktail])
        if cocktail.save
        else
            { errors: cocktail.errors.full_messages, status: "Unprocessable Entity" }.to_json
        end
    end

    #finding a cocktail by id to update
    patch "/cocktails/:id" do
        cocktail = Cocktail.find_by_id(params[:id])

        if cocktail
            cocktail.update(params[:cocktail])
            cocktail.to_json         
        else
            # params[:cocktail_ingredients].each do |cocktail_ingredient_params|
            #     #the cocktail ingredient params is the whole obj(cocktail_ingredients)
            #     #and I'm accessing the id in that in order to update said object

            #     cocktail_ingredient = cocktail.cocktail_ingredients.find_by_id(cocktail_ingredient_params[:id])
            #     cocktail_ingredient.update(cocktail_ingredient_params)
             
            # end
            { errors: cocktail.errors.full_messages, status: "Unprocessable Entity" }.to_json
        end
    end

    delete "/cocktails/:id" do
        cocktail = Cocktail.find_by_id(params[:id])
        if cocktail
            cocktail.destroy
            cocktail.to_json 
            #find our cocktail that we destroyed on the frontend so we can can delete it there also
        else
            { errors: ["Cocktail not found"], status: "Not Found"}.to_json
        end
    end
end

