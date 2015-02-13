class LinksController < ApplicationController
    
    def new
        @link = Link.new
    end
    
    def create
        @link = current_user.links.where(:film_id => params[:film_id]).first
        
        if @link && @link.status == true
            @link.update_attributes(:status => 0)
            p @link.errors
        elsif @link && @link.status == false
            @link.update_attributes(:status => 1)
            p @link.errors
        else
            @link = current_user.links.build(:film_id => params[:film_id], :status => params[:status])
            @film = current_user.films.build(:id => params[:film_id], :name => params[:name], :description => params[:description], :url => params[:url])
            @link.save
            @film.save
            p @link.errors
        end
        redirect_to :back
    end
    
    helper_method :create

end
