class UsersController < ApplicationController

    # POST /signup
    def signup 
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: 201
    end     

    def me
        # check if user is logged in if the session user ID exists 
        # byebug
        user = User.find(session[:user_id])
        render json: user, status: :ok
    end 

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end 
end
