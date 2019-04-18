class Discuss < ApplicationRecord
    has_many :user
    has_many :agenda, through: :user
end
