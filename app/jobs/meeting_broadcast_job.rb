class MeetingBroadcastJob < ApplicationJob
  queue_as :default

  def perform(agenda)
    # Do something later
    user = User.find(agenda.user_id)
    response_data = Hash.new
    response_data[:type] = "speak"
    response_data[:data] = Hash.new
    response_data[:data][:agenda] = agenda
    response_data[:data][:user] = user
    ActionCable.server.broadcast "meeting_#{user.discuss_id}", response_data
  end
end
