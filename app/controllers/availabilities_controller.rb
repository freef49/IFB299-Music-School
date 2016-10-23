class AvailabilitiesController < ApplicationController
  
before_action :activated_user, only: [:index, :new, :show, :edit, :delete]
  
  
  def index
    @availabilities = Availability.all
  end

  def show
    @availabilities = Availability.find(params[:id])
  end

  def new
    @availabilities = Availability.new
  end
  
  def create
    @availabilities = Availability.new(availability_params)
    if @availabilities.save
      flash[:success] = "Availability Added!"
      redirect_to(my_availabilities_path)
    else
      render('new')
    end
  end

  def edit
    @availabilities = Availability.find(params[:id])
  end
  
  def update
    @availabilities = Availability.find(params[:id])
    if @availabilities.update_attributes(availability_params)
      flash[:success] = "Availability updated!"
      redirect_to(my_availabilities_path)
    else
      render('edit')
    end
  end

  def delete
    @availabilities = Availability.find(params[:id])
  end
  
  def destroy
    @availabilities = Availability.find(params[:id])
    @availabilities.destroy
    flash[:success] = "Availability deleted!"
    redirect_to(my_availabilities_path)
  end

  private
  
  def availability_params
    params.require(:availability).permit(:user_email, :day, :time, :duration, :user_id)
  end
  
  def activated_user
      if !current_user.activated
       flash[:info]="You do not have permission to input availability yet"
       redirect_to(root_url)
      end
  end
end
