class SessionsController < ApplicationController 
    def new

    end

    def create
        organizer = Organizer.find_by(email: params[:session][:email].downcase)
        if organizer && organizer.authenticate(params[:session][:password])
            # using sessions to log in
            session[:organizer_id] = organizer.id            
            flash[:success] = "You are logged in!"
            redirect_to organizer_path(organizer)
        else
            #flash persists for one http request, flash.now doesn't
            flash.now[:danger] = "Incorrect credentials"
           render 'new' 
        end
    end
    
    def destroy
        session[:organizer_id] = nil
        flash[:success] = "You have logged out!"
        redirect_to root_path
    end
end