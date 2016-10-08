class AddParentEmailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :parent_email, :string
  end
end
