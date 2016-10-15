class InterviewsController < ApplicationController
  def index
    @interviews = Interview.all
  end

  def show
    @interviews = Interview.find(params[:id])
  end

  def new
    @interviews = Interview.new
  end
  
  def create
  end

  def edit
    @interviews = Interview.find(params[:id])
  end
  
  def update
  end

  def delete
    @interviews = Interview.find(params[:id])
  end
  
  def destroy 
  end
  
  private
  
  def interview_params
    params.require(:interview).permit(:user_email, :teacher_email, :date, :time, :duration)
  end
end
