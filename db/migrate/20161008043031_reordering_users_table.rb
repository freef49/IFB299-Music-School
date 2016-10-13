class ReorderingUsersTable < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :created_at, :datetime, before: :name
    change_column :users, :updated_at, :datetime, before: :name
    change_column :users, :teacher, :boolean, after: :parent_recieve_emails
    change_column :users, :admin, :boolean, after: :parent_recieve_emails
    change_column :users, :address, :string, after: :dob
  end
end
