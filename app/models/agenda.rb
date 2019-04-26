class Agenda < ApplicationRecord
  after_create_commit { MeetingBroadcastJob.perform_later self }
  validates :name,    presence: true
  validates :opinion, inclusion: {in: [true, false]}
  belongs_to :user
end
