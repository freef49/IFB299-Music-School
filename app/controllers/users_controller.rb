class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      flash[:success] = "Welcome to Mika Musical! Thanks for joining us :)"
      redirect_to @user # Handle a successful save.
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :last_name, :dob, :email, :gender, :facebook_ID, :password,
                                   :password_confirmation)
    end
end
