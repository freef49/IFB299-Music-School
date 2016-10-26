class SessionsController < ApplicationController
 #Functions for the sessions controller.
  def new
  end

  #If user is in system and authenticated. Create session.
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user

    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
  
end
