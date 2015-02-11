class LinksController < ApplicationController
    
    def new
        @link = Link.new
    end
    
    def create
        @link = Link.new()
        if button == "vu"
            return 1
        else
            return 0
        end
    end

end
