class Api::V1::UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?  
            render json: user
        else 
            render json: {errors: user.errors.full_messages}, status: :not_accepted

        end
    end

    private 

    def user_params 
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
