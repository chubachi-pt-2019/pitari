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
end
