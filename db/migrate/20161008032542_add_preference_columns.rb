class AddPreferenceColumns < ActiveRecord::Migration[5.0]
  def change
    add_column("preferences", "user_email", :string, :limit => 50 )
    add_column("preferences", "preferred_day", :string, :limit => 15 )
    add_column("preferences", "preferred_time", :varchar)
    add_column("preferences", "instrument", :string, :limit => 50 )
    add_column("preferences", "preferred_teacher_language", :string, :limit => 30 )
    add_column("preferences", "preferred_teacher_gender", :string, :limit => 10 )
    add_index("preferences", "user_email")
  end
end
