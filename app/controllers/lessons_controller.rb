class LessonsController < ApplicationController

before_action :student_user, only: [:new, :create]
before_action :logged_in_user



  def new
    @lessons =Lesson.new
  end
  
  def index
    @lessons = Lesson.all
    @interviews = Interview.all
  end
  
  def create
     @lessons = Lesson.new(lesson_params)
     if @lessons.save
       flash[:success] = "Lesson Booked!"
       redirect_to(my_lessons_path)
     else
       render('new')
     end
  end
  
  private
  
  def lesson_params
    params.require(:lesson).permit(:user_email, :student_email, :user_id, :start_date, :end_date , :day, :lesson_time, :lesson_type)
  end

end 