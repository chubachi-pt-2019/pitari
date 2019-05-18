class User < ApplicationRecord
  validates :name, presence: true
  belongs_to :discuss
  has_many :agendas

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Discuss.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end
end
