class AccountActivationsController < ApplicationController
  def edit
    user=User.find_by(id: params[:id])
    user.activate
     flash[:success] = "Account activated!"
    redirect_to teachers_path
    
    end
end
