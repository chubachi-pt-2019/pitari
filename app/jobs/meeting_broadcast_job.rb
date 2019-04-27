class MeetingBroadcastJob < ApplicationJob
  queue_as :default

  def perform(agenda)
    # Do something later
    user = User.find(agenda.user_id)
    ActionCable.server.broadcast "meeting_#{user.discuss_id}", agenda: agenda, user: user
  end
end
