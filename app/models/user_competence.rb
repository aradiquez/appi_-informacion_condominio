class UserCompetence < ActiveRecord::Base
  belongs_to :user
  belongs_to :competence
end
