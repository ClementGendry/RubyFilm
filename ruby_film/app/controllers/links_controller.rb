class LinksController < ApplicationController
    
    def new
        @link = Link.new
    end
    
    def create
        @link = Link.new(:user_id => params[:user_id], :film_id => params[:film_id], :status => params[:status], :created_at => Time.now)
        @link.save
        redirect_to :controller => "films" , :action => "fiche"
    end
    helper_method :create
end
