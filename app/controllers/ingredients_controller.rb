class IngredientsController < ApplicationController
    get "/ingredients" do
        ingredient = Ingredient.all
        ingredient.to_json
    end

    post "/ingredients" do
        ingredient = Ingredient.new(params[:ingredient])
            if ingredient.save        #goes through validations
                ingredient.to_json
            else
                #outputs the errors in sentence like in the rake console
                { errors: ingredient.errors.full_messages }.to_json
        end
    end 
end