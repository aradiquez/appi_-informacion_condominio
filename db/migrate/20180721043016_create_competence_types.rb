class CreateCompetenceTypes < ActiveRecord::Migration
  def change
    create_table :competence_types do |t|
      t.string :code
      t.string :name
      t.boolean :required
      t.string :details

      t.timestamps null: false
    end
  end
end
