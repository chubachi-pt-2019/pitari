App.meeting = App.cable.subscriptions.create "MeetingChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log data
    $("#user-name-display").text(data.user.name)
    $("#agenda-name-display").text(data.agenda.name)
    opinion = data.agenda.opinion
    if opinion
      $("#agenda-opinion-display-positive").show()
      $("#agenda-opinion-display-negative").hide()
    else
      $("#agenda-opinion-display-positive").hide()
      $("#agenda-opinion-display-negative").show()
    


  speak: (agenda_name, agenda_opinion, user_id) ->
    @perform 'speak', agenda_name: agenda_name, agenda_opinion: agenda_opinion, user_id: user_id

$(document).ready () ->
  $("#user-speak").on 'click', () ->
    App.meeting.speak($("input[name='agenda_name']").val(), $("input[name='agenda_opinion']:checked").val(), $("input[name='user_id']").val())
    $("input[name='agenda_name']").val('')