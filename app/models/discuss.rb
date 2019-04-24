class Discuss < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :agendas, through: :users
end
