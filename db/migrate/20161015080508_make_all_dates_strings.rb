class MakeAllDatesStrings < ActiveRecord::Migration[5.0]
  def change
    change_column("interviews", "date", :string)
    change_column("lessons", "start_date", :string)
    change_column("lessons", "end_date", :string)
  end
end
