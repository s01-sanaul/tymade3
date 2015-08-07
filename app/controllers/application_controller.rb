class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def home
  end 
  
   def login_required
    user = User.find_by(id: session['uid'])
    @alert = false
    if user.blank?
      @alert = true
      redirect_to('/sessions/new')
    end
  end
  
end
