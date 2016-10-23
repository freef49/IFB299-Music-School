class LessonsController < ApplicationController

  def new
    @lessons =Lesson.new
  end

  def create
     @lessons = Lesson.new(lesson_params)
     if @lessons.save
       flash[:success] = "Lesson Booked!"
       redirect_to(root_url)
     else
       render('new')
     end
  end
  
  private
  
  def lesson_params
    params.require(:lesson).permit(:user_email, :student_email, :user_id, :start_date, :end_date , :day, :lesson_time, :lesson_type)
  end

end 