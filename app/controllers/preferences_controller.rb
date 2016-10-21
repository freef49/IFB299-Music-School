class PreferencesController < ApplicationController
  
  def index
    @preferences = Preference.where(:user_email => current_user.email)
  end
  
  def show
    @preferences = Preference.find(params[:id])
  end

  def new
    @preferences = Preference.new
  end
  
  def create
    @preferences = Preference.new(preference_params)
    if @preferences.save
      flash[:success] = "Preference Created!"
      redirect_to(my_preferences_path)
    else
      render('new')
    end
  end

  def edit
    @preferences = Preference.find(params[:id])
  end
  
  def update
    @preferences = Preference.find(params[:id])
    if @preferences.update_attributes(preference_params)
      flash[:success] = "Preferences updated!"
      redirect_to(my_preferences_path)
    else
      render('edit')
    end
  end
  
  def delete
    @preferences = Preference.find(params[:id])
  end
  
  def destroy
    @preferences = Preference.find(params[:id])
    @preferences.destroy
    flash[:success] = "Preference deleted!"
    redirect_to(my_preferences_path)
  end
  
  private
  
  def preference_params
    params.require(:preference).permit(:user_email, :user_id, :preferred_day, :preferred_time, :instrument, :preferred_teacher_language, :preferred_teacher_gender)
  end
end
