class ApplicationController < ActionController::Base
  #Functions for the application controller.
  protect_from_forgery with: :exception
  #Include SessionHelpers. Allows helpers to be executed.
  include SessionsHelper
  
    private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    def teacher_user
      redirect_to(root_url) unless current_user.teacher?
    end
end
