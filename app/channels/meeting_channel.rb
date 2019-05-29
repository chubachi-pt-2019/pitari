class MeetingChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "meeting_#{current_user.discuss_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    OfflineJob.perform_later current_user
  end

  def speak(data)
    Agenda.create!(name: data['agenda_name'], opinion: data['agenda_opinion'], user_id: current_user.id)
  end
  def understandUpdate(data)
    updateUser = User.find(current_user.id)
    if current_user.id.to_i == data['user_id'].to_i
      updateUser.update(understand: data['understand'])
    end
  end 
end
