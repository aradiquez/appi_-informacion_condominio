class CreatePersonQuestions < ActiveRecord::Migration
  def change
    create_table :person_questions do |t|
      t.references :person, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
