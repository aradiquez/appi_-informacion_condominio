class CreateFilials < ActiveRecord::Migration
  def change
    create_table :filials do |t|
      t.string :number
      t.string :filial_name
      t.timestamps null: false
    end
  end
end
