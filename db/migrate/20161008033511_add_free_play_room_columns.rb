class AddFreePlayRoomColumns < ActiveRecord::Migration[5.0]
  def change
    add_column("free_play_rooms", "user_email", :string, :limit => 50 )
    add_column("free_play_rooms", "date", :date)
    add_column("free_play_rooms", "time", :varchar)
    add_column("free_play_rooms", "duration", :varchar)
    add_index("free_play_rooms", "user_email")
  end
end
