class CreateCompetences < ActiveRecord::Migration
  def change
    create_table :competences do |t|
      t.string :code
      t.string :name
      t.boolean :required
      t.boolean :active
      t.references :competence_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
