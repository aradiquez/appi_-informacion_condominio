class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.boolean :active
      t.boolean :required
      t.references :person_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
