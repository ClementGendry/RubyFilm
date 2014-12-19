class FilmController
    
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
    
end