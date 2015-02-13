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
        @film_database = current_user.films.where(:film_id => params[:id]).first
        if !@film_database.nil?
            @link_film = Link.where(:user_id => current_user.id, :film_id => @film_database.id ).first
        end
        p @link_film
    end
    
    def user_space
        @all_films = current_user.films
    end

    def a_voir
        @all_films = current_user.films
    end

    def a_voir
        @status = current_user.links.where(:status => 2)
        @links = Array.new
        @status.each do |film|
            @links.push[film.film_id]
        end
        @all_films = current_user.films.find(@links)
       end
end
