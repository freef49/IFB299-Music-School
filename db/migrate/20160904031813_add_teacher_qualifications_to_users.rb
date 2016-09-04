class AddTeacherQualificationsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :teacher_qualifications, :string
  end
end
