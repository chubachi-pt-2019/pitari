class MeetingChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "meeting_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Agenda.create!(name: data['agenda_name'], opinion: data['agenda_opinion'], user_id: data["user_id"])
  end
end
