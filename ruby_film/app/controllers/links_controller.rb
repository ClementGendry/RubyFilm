class LinksController < ApplicationController
    
    def new
        @link = Link.new
    end
    
    def create
        @link = Link.new(:user_id => "", :film_id => 1, :status => "")
        @link.save
    end

end
