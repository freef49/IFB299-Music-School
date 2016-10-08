class AddUserIdToAllTables < ActiveRecord::Migration[5.0]
  def change
    add_column("availabilities", "user_id", :integer)
    add_column("interviews", "user_id", :integer)
    add_column("lessons", "user_id", :integer)
    add_column("preferences", "user_id", :integer)
    add_column("skills", "user_id", :integer)
  end
end
