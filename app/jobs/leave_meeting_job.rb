class LeaveMeetingJob < ApplicationJob
    queue_as :default
  
    def perform(user)
        find_user = User.find(user.id)
        if !find_user.active
            response_data = Hash.new
            response_data[:type] = 'leave'
            response_data[:data] = user.id
            ActionCable.server.broadcast "meeting_#{user.discuss_id}", response_data
        end
    end
  end
  