class OrganizersController < ApplicationController
    # execute these functions on server start
    before_action :set_organizer, only: [:edit, :update, :show, :destroy]
    before_action :require_same_organizer, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:destroy]

    def index
        #for pagination
        @organizers = Organizer.paginate(page: params[:page], per_page: 10)
    end

    def new
        @organizer = Organizer.new
    end

    def create
        @organizer = Organizer.new(organizer_params)
        if @organizer.save
            session[:organizer_id] = @organizer.id
            flash[:success] = "Hey #{@organizer.username}! Welcome to EVENTRO!"
            redirect_to organizer_path(@organizer)
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
        @organizer_events = @organizer.events.paginate(page: params[:page], per_page: 5)
    end

    def destroy
        @organizer.destroy
        flash[:danger] = "Organizer and all events created by organizer have been deleted"
        redirect_to organizers_path
    end


    private
    #allow params to be accessible by actions
    def organizer_params
        params.require(:organizer).permit(:username, :email, :password)
    end

    #init instance variable @event
    def set_organizer
            @organizer = Organizer.find(params[:id])
    end

    #check if the event belong to the logged in organizer
    def require_same_organizer
        if current_organizer != @organizer and !current_organizer.admin?
            flash[:danger] = "You can only edit your own profile"
            redirect_to root_path
        end
    end
    def require_admin
        if logged_in? and !current_organizer.admin?
            flash[:danger] = "You must be an admin to do this"
            redirect_to root_path
        end
    end
end