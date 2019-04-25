class Agenda < ApplicationRecord
  validates :name,    presence: true
  #validates :opinion, presence: true
  belongs_to :user
end
