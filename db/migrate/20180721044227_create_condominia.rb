class CreateCondominia < ActiveRecord::Migration
  def change
    create_table :condominia do |t|
      t.string :first_name
      t.string :last_name
      t.string :identification
      t.integer :filial_number
      t.string :phone_number
      t.decimal :status
      t.boolean :active
      t.date :birthday
      t.references :filial, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
