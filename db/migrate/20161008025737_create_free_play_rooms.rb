class CreateFreePlayRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :free_play_rooms do |t|

      t.timestamps
    end
  end
end
