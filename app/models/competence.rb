class Competence < ActiveRecord::Base
  has_many :users, through: :user_competences
  belongs_to :competence_type
end
