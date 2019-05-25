class ReturnJob < ApplicationJob
    queue_as :return
  
    def perform(user)
        user.update!(active: true)
        response_data = Hash.new
        response_data[:type] = 'join'
        response_data[:data] = user
        ActionCable.server.broadcast "meeting_#{user.discuss_id}", response_data
    end
end