class EventsController < ApplicationController
    before_action :set_event_params, only: [:edit, :update, :show, :destroy]
    before_action :require_organizer, except: [:index, :show]
    before_action :require_same_organizer, only: [:edit, :update, :destroy]

    def index
        #for pagination
        @events = Event.where('startsat > ?', Time.current ).paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @event = Event.new
    end

    def edit

    end

    def update
        if @event.update(event_params)
            flash[:success] = "Successfully updated the event!"
            redirect_to event_path(@event)
        else
            render 'edit'
        end
    end

    def create
        @event = Event.new(event_params)
        @event.organizer = current_organizer
        
        if @event.save
            flash[:success] = "Successfully created the event!"
            redirect_to event_path(@event)
        else
            render 'new'
        end
    end

    def show
        
    end

    def destroy
        @event.destroy
        flash[:danger] = "Event deleted!"
        redirect_to events_path        
    end

    private
    def set_event_params
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description, :venue, :startsat, :endsat, :latitude, :longitude)
    end

    def require_same_organizer
        if current_organizer != @event.organizer and !current_organizer.admin?
            flash[:danger] = "You can only edit or delete your own events"
            redirect_to root_path
        end 
    end
end