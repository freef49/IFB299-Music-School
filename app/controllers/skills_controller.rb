class SkillsController < ApplicationController
  
  before_action :logged_in_user
  before_action :teacher_user
  
  def index
    @skills = Skill.where(:user_email => current_user.email)
  end

  def show
     @skills = Skill.find(params[:id])
  end

  def new
     @skills = Skill.new
  end
  
  def create
    @skills = Skill.new(skill_params)
    if @skills.save
      flash[:success] = "Skill Added!"
      redirect_to(my_skills_path)
    else
      render('new')
    end
  end

  def edit
    @skills = Skill.find(params[:id])
  end
  
  def update
    @skills = Skill.find(params[:id])
    if @skills.update_attributes(skill_params)
      flash[:success] = "Skill Edited!"
      redirect_to(my_skills_path)
    else
      render('new')
    end
  end

  def delete
    @skills = Skill.find(params[:id])
  end
  
  def destroy
    @skills = Skill.find(params[:id])
    @skills.destroy
    flash[:success] = "Skill deleted!"
    redirect_to(my_skills_path)
  end
  
  private
  
  def skill_params
    params.require(:skill).permit(:user_email, :user_id, :instrument, :instrument_skill, :language, :language_skill)
  end
end
