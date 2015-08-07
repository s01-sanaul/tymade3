class SessionsController < ApplicationController 
  
  def new 
  end 
 
  def confirm
  end
  
  def create 
    u = User.find_by(username: params["username"])
    if u && u.authenticate(params["password"])
      #sessions["username"] = params["username"]
      session["user_id"] = u.id
      redirect_to "/tyms"
    else
      redirect_to "/sessions/new"
    end
  end
  
  def destroy 
    reset_session
    redirect_to "/tymade/home"
  end
  
end 
