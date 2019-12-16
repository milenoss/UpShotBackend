class Api::V1::EventsController < ApplicationController

    def create 
        event = Event.create(event_params)
        user = @current_user
        event.update(user: user)
        if event.valid?
            render json: event
        else 
            render json: { errors: event.errors.full_messages}, status: :not_accepted
        end
    end

    def show 
        render json: Event.find(params[:id])
    end
    private 

    def event_params
        params.require(:event).permit(:title, :content)
    end
end
