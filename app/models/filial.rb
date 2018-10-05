class Filial < ActiveRecord::Base
  has_many :condominiums, dependent: :destroy
  has_many :condominium_childs, dependent: :destroy
  has_many :authorized_vehicles, dependent: :destroy
  has_many :people, dependent: :destroy
end
