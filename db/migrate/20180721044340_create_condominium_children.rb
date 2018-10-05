class CreateCondominiumChildren < ActiveRecord::Migration
  def change
    create_table :condominium_children do |t|
      t.string :first_name
      t.string :last_name
      t.string :identification
      t.string :car_plate
      t.references :filial, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
