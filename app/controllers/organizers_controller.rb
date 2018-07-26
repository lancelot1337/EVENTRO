class OrganizersController < ApplicationController
    def new
        @organizer = Organizer.new
    end

    def create
        @organizer = Organizer.new(organizer_params)
        if @organizer.save
            flash[:success] = "Hey #{@organizer.username}! Welcome to EVENTRO!"
            redirect_to events_path
        else
            render 'new'
        end
    end

    private
    def organizer_params
        params.require(:organizer).permit(:username, :email, :password)
    end
end