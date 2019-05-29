class User < ApplicationRecord
  after_create_commit { JoinMeetingJob.perform_later self }
  after_update_commit { UpdateUnderstandJob.perform_later self }
  validates :name, presence: true
  belongs_to :discuss
  has_many :agendas
end
