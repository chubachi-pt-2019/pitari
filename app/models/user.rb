class User < ApplicationRecord
    belongs_to :discuss
    has_many :agenda
end
