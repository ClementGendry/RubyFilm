class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index    
    if current_user
      @name = current_user.name
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end
    
end
