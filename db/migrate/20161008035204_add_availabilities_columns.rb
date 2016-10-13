class AddAvailabilitiesColumns < ActiveRecord::Migration[5.0]
  def change
    add_column("availabilities", "user_email", :string, :limit => 50 )
    add_column("availabilities", "day", :string, :limit => 15)
    add_column("availabilities", "time", :varchar)
    add_column("availabilities", "duration", :varchar)
    add_index("availabilities", "user_email")
  end
end
