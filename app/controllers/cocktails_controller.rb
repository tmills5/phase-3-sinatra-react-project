class CocktailsController < ApplicationController

    #getting all of the cocktails. 
    #returns the cocktail AND the ingredients through the join table
    #that way we see the cocktail, and the actual ingredient-not just the ingredient ID
    get "/cocktails" do
        @cocktails = Cocktail.all
        @cocktails.to_json(include: [cocktail_ingredients: { include: [:ingredient] }])
    end

    post "/cocktails" do
        #binding.pry
        cocktail = Cocktail.new(params[:cocktail])
        if cocktail.save
            #adding the ingredients to the cocktail
            #creating the ingredient and passing in the measurement and the ingredient_id
            params[:cocktail_ingredients].each { |cocktail_ingredient| cocktail.cocktail_ingredients.create(cocktail_ingredient) }
            cocktail.to_json(include: [cocktail_ingredients: { include: [:ingredient] }])
        else
            { errors: cocktail.errors.full_messages, status: "Unprocessable Entity" }.to_json
        end
    end

    #finding a cocktail by id to update
    patch "/cocktails/:id" do
        cocktail = Cocktail.find_by_id(params[:id])
        if cocktail && cocktail.update(params[:cocktail])
            #if cocktail params updates, then move on to cocktai_ingredient
            params[:cocktail_ingredients].each do |cocktail_ingredient_params|
                #the cocktail ingredient params is the whole obj(cocktail_ingredients)
                #and I'm accessing the id in that in order to update said object
                cocktail_ingredient = cocktail.cocktail_ingredients.find_by_id(cocktail_ingredient_params[:id])
                cocktail_ingredient.update(cocktail_ingredient_params)
            end
            cocktail.to_json(include: [cocktail_ingredients: { include: [:ingredient] }])
        else
            { errors: cocktail.errors.full_messages, status: "Unprocessable Entity" }.to_json
        end
    end

    delete "/cocktails/:id" do
        cocktail = Cocktail.find_by_id(params[:id])
        if cocktail
            cocktail.destroy
            cocktail.to_json #find our cocktail that we destroyed on the frontend so we can can delete it there also
        else
            { errors: ["Cocktail not found"], status: "Not Found"}.to_json
        end
    end
end

