class EventsController < ApplicationController
    def new
        @event = Event.new
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

    private
    def event_params
        params.require(:event).permit(:title, :description, :venue, :startsat, :endsat)
    end
    def events_show

    end
end