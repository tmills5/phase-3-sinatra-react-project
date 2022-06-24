class ReviewsController < ApplicationController

    get "/reviews" do
        @review = Review.all
        @review.to_json
    end


    #fetch all reviews for each individual cocktail
    get "/reviews/:cocktail_id" do
        cocktail = Cocktail.find_by_id(params[:cocktail_id])
        cocktail.reviews.to_json
    end

    post "/reviews" do
        review = Review.create(
            comment: params[:comment],
            user_name: params[:user_name]
        )
    end


end





