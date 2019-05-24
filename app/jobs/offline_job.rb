class OfflineJob < ApplicationJob
    queue_as :default
  
    def perform(user)
        user.update!(active: false)
        LeaveMeetingJob.set(wait: 3.second).perform_later user
    end
end