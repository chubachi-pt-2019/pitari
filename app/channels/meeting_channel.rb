class MeetingChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "meeting_#{current_user.discuss_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    response_data = Hash.new
    response_data[:type] = "leave"
    response_data[:data] = current_user.id
    current_user.update!(active: false)
    ActionCable.server.broadcast "meeting_#{current_user.discuss_id}", response_data
  end

  def speak(data)
    Agenda.create!(name: data['agenda_name'], opinion: data['agenda_opinion'], user_id: current_user.id)
  end
end
