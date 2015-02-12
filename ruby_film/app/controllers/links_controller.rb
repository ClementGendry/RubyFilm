class LinksController < ApplicationController
    
    def new
        @link = Link.new
    end
    
    def create
        @link = current_user.links.where(:film_id => params[:film_id]).first
        
        if @link
            @link.update_attributes(:status => params[:status])
            p @link.errors
            redirect_to :back
        else
            @link = current_user.links.build(:film_id => params[:film_id], :status => params[:status])
            @link.save
            p @link.errors
            redirect_to :back
        end
        
    end
    
    helper_method :create

end
