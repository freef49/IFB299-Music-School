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
    @interviews = Interview.new(interview_params)
    if @interviews.save
      flash[:success] = "Interview Booked!"
      redirect_to(my_interviews_path)
    else
      render('new')
    end
  end

  def edit
    @interviews = Interview.find(params[:id])
  end
  
  def update
    @interviews = Interview.find(params[:id])
    @interviews.update_attributes(interview_params)
    if @interviews.save
      flash[:success] = "Interview Updated!"
      redirect_to(my_interviews_path)
    else
      render('new')
    end
  end

  def delete
    @interviews = Interview.find(params[:id])
  end
  
  def destroy 
    @interviews = Interview.find(params[:id])
    @interviews.destroy
    flash[:success] = "Interview deleted"
    redirect_to(my_interviews_path)
  end
  
  private
  
  def interview_params
    params.require(:interview).permit(:user_email, :user_id, :teacher_email, :date, :time, :duration)
  end
end
