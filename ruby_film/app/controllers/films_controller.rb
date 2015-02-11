class FilmsController < ApplicationController

    def index
        #prints views
        if params[:query].present?
            @search = Tmdb::Movie.find(params[:query])
        end
    end
    
    def new
        @film = Film.new
    end
    
    def create
        @film = Film.new(params[:film])
        if @film.save
            redirect_to @film
        else
            render "new"
        end
    end
    
    def search
        @search = Tmdb::Movie.find(params[:query])
    end
    
    def fiche
        #prints views
        @fiche = Tmdb::Movie.detail(params[:id])
        @trailer = Tmdb::Movie.trailers(params[:id])
    end

end
