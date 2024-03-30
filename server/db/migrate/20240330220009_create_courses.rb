class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :section
      t.string :meeting_url
      t.bigint :school_id
      t.time :starting_time
      t.time :ending_time

      t.timestamps
    end
  end
end
