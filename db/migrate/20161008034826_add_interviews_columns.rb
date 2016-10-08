class AddInterviewsColumns < ActiveRecord::Migration[5.0]
  def change
    add_column("interviews", "user_email", :string, :limit => 50 )
    add_column("interviews", "teacher_email", :string, :limit => 50 )
    add_column("interviews", "date", :date)
    add_column("interviews", "time", :varchar)
    add_column("interviews", "duration", :varchar)
    add_index("interviews", "user_email")
  end
end
