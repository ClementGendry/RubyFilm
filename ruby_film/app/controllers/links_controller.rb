class LinksController < ApplicationController
    
    def new
        @link = Link.new
    end
    
    def create
        @link = Link.new()

    end

end
