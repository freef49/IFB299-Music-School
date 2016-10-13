class FixUsersTable < ActiveRecord::Migration[5.0]
  def change
    add_column("users", "address", :string, :after => "gender")
    add_column("users", "parent_moblie", :varchar, :after => "parent_name")
    add_column("users", "user_recieve_emails", :boolean)
    add_column("users", "parent_recieve_emails", :boolean)
  end
end
