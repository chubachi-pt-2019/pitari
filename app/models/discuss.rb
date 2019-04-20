class Discuss < ApplicationRecord
    has_many :users
    has_many :agendas, through: :users

end
