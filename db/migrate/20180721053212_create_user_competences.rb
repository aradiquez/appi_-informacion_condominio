class CreateUserCompetences < ActiveRecord::Migration
  def change
    create_table :user_competences do |t|
      t.references :user, index: true, foreign_key: true
      t.references :competence, index: true, foreign_key: true
      t.boolean :status
      t.string :details

      t.timestamps null: false
    end
  end
end
