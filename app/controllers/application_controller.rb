class ApplicationController < ActionController::Base
    # to make them accessible by views
    helper_method :current_organizer, :logged_in?, :ret_coor

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

    def ret_coor venue_name
        if venue_name == "Mini Audi" || venue_name == "Mini audi" || venue_name == "mini audi" || venue_name == "Mini Auditoriam" || venue_name == "Mini auditoriam" || venue_name == "mini auditoriam"
            return [28.609655,77.038065]
        elsif venue_name == "Audi" || venue_name == "audi" || venue_name == "Auditoriam"|| venue_name == "auditoriam" || venue_name == "Main Audi" || venue_name == "Main audi" || venue_name == "main audi"
            return [28.609836,77.036973]
        elsif venue_name == "CBT" || venue_name == "Cbt" || venue_name == "cbt" || venue_name == "Connecting Block Terrace" || venue_name == "Connecting block terrace" || venue_name == "connecting block terrace"
            return [28.609726,77.037940]
        elsif venue_name == "Nescii" || venue_name == "nescii" || venue_name == "Nescii Lawns" || venue_name == "Nescii nawns" || venue_name == "nescii lawns" || venue_name == "Nescii Lawn" || venue_name == "Nescii lawn" || venue_name == "nescii lawn"
            return [28.609848,77.035703]
        end
    end
end
