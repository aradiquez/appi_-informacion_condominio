class CreatePersonSchedules < ActiveRecord::Migration
  def change
    create_table :person_schedules do |t|
      t.references :person, index: true, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.boolean :holidays

      t.timestamps null: false
    end
  end
end
