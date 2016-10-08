class AddUserIdToFreePlayRoom < ActiveRecord::Migration[5.0]
  def change
    add_column("free_play_rooms", "user_id", :integer)
  end
end
