class AddSchoolIdTGoStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :school_id, :bigint
    add_foreign_key :users, :schools
  end
end
