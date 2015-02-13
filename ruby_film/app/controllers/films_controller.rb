class FilmsController < ApplicationController

    def index
        #prints views
        if params[:query].present?
            @search = Tmdb::Movie.find(params[:query])
        else
            @popular = Tmdb::Movie.popular
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
        @link_film = current_user.links.first
    end
    
    def user_space
        @all_films = current_user.films
    end

    def a_voir
        @all_films = current_user.films
    end

end
