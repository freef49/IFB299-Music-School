class MakeDateStringInFreePlayRoom < ActiveRecord::Migration[5.0]
  def change
    change_column("free_play_rooms", "date", :string)
  end
end
