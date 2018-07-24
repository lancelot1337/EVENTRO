class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    
    def new
        @event = Event.new
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            flash[:notice] = "Successfully updated the event!"
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
        @event = Event.find(params[:id])
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        flash[:notice] = "Event deleted!"
        redirect_to events_path        
    end

    private
    def event_params
        params.require(:event).permit(:title, :description, :venue, :startsat, :endsat)
    end
    def events_show

    end
end