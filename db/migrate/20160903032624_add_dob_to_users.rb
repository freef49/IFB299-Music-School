class AddDobToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dob, :TEXT
  end
end
