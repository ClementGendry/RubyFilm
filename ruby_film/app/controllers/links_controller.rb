class LinksController < ApplicationController
    
    def new
        @link = Link.new
    end
    
    def create
        @film = Film.where(:film_id => params[:film_id]).first

        if !@film
          @film = Film.create(:film_id => params[:film_id], :name => params[:name], :description => params[:description], :url => params[:url])
        end

        @link = current_user.links.where(:film_id => @film.id).first

        if @link && @link.status == true
            @link.destroy
        elsif @link && @link.status == false
            @link.update_attributes(:status => 1)
        else
            @link = current_user.links.build(:film_id => @film.id, :status => params[:status])
            @link.save
        end


        redirect_to :back

    end
    
    helper_method :create

end
