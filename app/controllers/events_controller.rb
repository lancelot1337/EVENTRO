class EventsController < ApplicationController
    before_action :set_event_params, only: [:edit, :update, :show, :destroy]
    
    def index
        @events = Event.all
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
        params.require(:event).permit(:title, :description, :venue, :startsat, :endsat)
    end

    def events_show

    end
end