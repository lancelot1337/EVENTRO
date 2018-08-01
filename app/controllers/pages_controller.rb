class PagesController < ApplicationController
    #change home page is user is authenticated
    def home
        redirect_to events_path if logged_in?
    end

    def about
    end
end