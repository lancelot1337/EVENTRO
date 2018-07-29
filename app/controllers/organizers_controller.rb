class OrganizersController < ApplicationController
    before_action :set_organizer, only: [:edit, :update, :show, :destroy]
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
    end

    def update
        if @organizer.update(organizer_params)
            flash[:success] = "Account updated successfully"
            redirect_to events_path
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @organizer.destroy
        flash[:danger] = "Organizer and all events created by organizer have been deleted"
        redirect_to organizers_path
    end


    private
    def organizer_params
        params.require(:organizer).permit(:username, :email, :password)
    end
        def set_organizer
            @organizer = Organizer.find(params[:id])
    end
end