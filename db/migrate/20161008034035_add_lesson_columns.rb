class AddLessonColumns < ActiveRecord::Migration[5.0]
  def change
    add_column("lessons", "user_email", :string, :limit => 50 )
    add_column("lessons", "student_email", :string, :limit => 50 )
    add_column("lessons", "start_date", :date)
    add_column("lessons", "end_date", :date)
    add_column("lessons", "day", :string, :limit => 15)
    add_column("lessons", "lesson_time", :varchar)
    add_column("lessons", "lesson_type", :string)
    add_column("lessons", "lesson_duration", :varchar)
    add_column("lessons", "lesson_cost", :varchar, :limit => 15)
    add_index("lessons", "user_email")
  end
end
