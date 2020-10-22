class SessionsController < ApplicationController
  def new
  end
  
  def create   
    user = User.find_by_email(params[:email])   
    if user && user.authenticate(params[:password])   
      session[:user_id] = user.id   
      if user.admin? 
        redirect_to '/admin/users'
      else
        redirect_to root_url, notice: 'Logged in!'
      end    
    else   
      render :new   
    end   
  end   
  def destroy   
    session[:user_id] = nil   
    redirect_to root_url, notice: 'Logged out!'   
  end   
end
