class UsersController < ApplicationController
    get "/users" do
        user = User.all
        user.to_json
    end

    post "/users" do
        user = User.new(params[:user])
            if user.save        #goes through validations
                user.to_json
            else
                #outputs the errors in sentence like in the rake console
                { errors: user.errors.full_messages }.to_json
        end
    end 
end