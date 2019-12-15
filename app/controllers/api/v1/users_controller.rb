class Api::V1::UsersController < ApplicationController

    def create
        user = User.create(user_params)
        # byebug
        if user.valid?  
            render json: {user: UserSerializer.new(user), token: user.token }
        else 
            render json: { errors: user.errors.full_messages }, status: :not_accepted

        end
    end

    def login 
        user = User.find_by(email: login_params[:email])
        if user && user.authenticate(login-params[:password])
            render json: 
    end


    def show
        user = User.find(params[:id])
        render json: user
    end

    private 

    def user_params 
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def user_params 
        params.require(:user).permit(:email, :password)
end
