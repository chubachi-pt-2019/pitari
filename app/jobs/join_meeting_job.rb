class JoinMeetingJob < ApplicationJob
  queue_as :default

  def perform(user)
    response_data = Hash.new
    response_data[:type] = 'join'
    response_data[:data] = user
    ActionCable.server.broadcast "meeting_#{user.discuss_id}", response_data
  end
end
