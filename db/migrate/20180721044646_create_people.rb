class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :identification
      t.string :nationality
      t.string :car_plate
      t.references :person_type, index: true, foreign_key: true
      t.references :filial, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
