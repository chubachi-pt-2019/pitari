class UpdateUnderstandJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    response_data = Hash.new
    response_data[:type] = "updateUnderstand"
    response_data[:data] = Hash.new
    response_data[:data][:user] = user
    ActionCable.server.broadcast "meeting_#{user.discuss_id}", response_data
  end
end
