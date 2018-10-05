class CreateAuthorizedVehicles < ActiveRecord::Migration
  def change
    create_table :authorized_vehicles do |t|
      t.string :car_plate
      t.string :brand
      t.string :color
      t.string :style
      t.string :other
      t.references :filial, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
