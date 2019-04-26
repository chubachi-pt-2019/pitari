class MeetingBroadcastJob < ApplicationJob
  queue_as :default

  def perform(agenda)
    # Do something later
    user = User.find(agenda.user_id)
    ActionCable.server.broadcast 'meeting_channel', agenda: agenda, user: user
  end
end
