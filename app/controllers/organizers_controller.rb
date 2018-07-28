class OrganizersController < ApplicationController
    def index
        @organizers = Organizer.paginate(page: params[:page], per_page: 5)
    end

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

    def edit
        @organizer = Organizer.find(params[:id])
    end

    def update
        @organizer = Organizer.find(params[:id])
        if @organizer.update(organizer_params)
            flash[:success] = "Account updated successfully"
            redirect_to events_path
        else
            render 'edit'
        end
    end

    def show
        @organizer = Organizer.find(params[:id])
    end

    private
    def organizer_params
        params.require(:organizer).permit(:username, :email, :password)
    end
end