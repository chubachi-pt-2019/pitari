class User < ApplicationRecord
  validates :name, presence: true
  belongs_to :discuss
  has_many :agendas
end
