class ApplicationController < ActionController::Base
    # to make them accessible by views
    helper_method :current_organizer, :logged_in?

    def current_organizer
        # return the current organizer
        # Organizer.find(session[:organizer_id]) if session[:organizer_id]

        # using memoization
        @current_organizer  ||= Organizer.find(session[:organizer_id]) if session[:organizer_id]
    end

    def logged_in?
        # return true if current_organizer exists
        !!current_organizer
    end

    #check if user is authenticated
    def require_organizer
        if !logged_in?
            flash[:danger] = "You must be logged in to perform that action"
            redirect_to root_path
        end
    end
end
