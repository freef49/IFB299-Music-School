class ChangeSkillsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column("skills", "instrument_2")
    remove_column("skills", "instrument_2_skills")
    remove_column("skills", "language_2")
    remove_column("skills", "language_2_skills")
    
    rename_column("skills", "instrument_1", "instrument")
    rename_column("skills", "instrument_1_skils", "instrument_skill")
    rename_column("skills", "language_1", "language")
    rename_column("skills", "language_1_skils", "language_skill")
  end
end
