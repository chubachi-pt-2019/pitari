class User < ApplicationRecord
  after_create_commit { JoinMeetingJob.perform_later self }
  validates :name, presence: true
  belongs_to :discuss
  has_many :agendas
end
