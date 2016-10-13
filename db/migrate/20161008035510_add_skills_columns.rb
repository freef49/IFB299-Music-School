class AddSkillsColumns < ActiveRecord::Migration[5.0]
  def change
    add_column("skills", "user_email", :string, :limit => 50 )
    add_column("skills", "instrument_1", :string)
    add_column("skills", "instrument_1_skils", :string)
    add_column("skills", "instrument_2", :string)
    add_column("skills", "instrument_2_skills", :string)
    add_column("skills", "language_1", :string)
    add_column("skills", "language_1_skils", :string)
    add_column("skills", "language_2", :string)
    add_column("skills", "language_2_skills", :string)
    add_index("skills", "user_email")
  end
end
