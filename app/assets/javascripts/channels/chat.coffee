App.chat = null

current_user_id = ->
	$('input:hidden[name="from_id"]').val()
user_id = ->
	$('input:hidden[name="to_id"]').val()
room_id = ->
	$('input:hidden[name="room_id"]').val()
room_ch = ->
	id = room_id()
	if id?
		return {channel: 'ChatChannel', room_id: id}
	else
		return null

messages_height = ->
	temp = 0;
	$("div.message").each ->
	temp += ($(this).height());
	return temp

window.addEventListener 'onunload' , ->
	if room_ch()?
		App.chat.unsubscribe()

window.addEventListener 'load', ->
	if room_ch()?
		App.chat = App.cable.subscriptions.create room_ch(),
			received: (data) ->
				$('#messages').append data['message']
				$('div.message_box').scrollTop(messages_height());

			speak: (from_id, to_id, room_id, content) ->
				@perform 'speak', {
					"from_id": from_id
					"to_id": to_id
					"room_id": room_id
					"content": content
				}

$(document).on 'keypress', '[data-behavior~=chat_speaker]', (event) ->
	if event.which is 13
		value = event.target.value
		if value.replace(/\s/g, '').length > 0 && value.length <= 50
			App.chat.speak(current_user_id(), user_id(), room_id(), value)
			event.target.value = ''
			event.preventDefault()
		else if value.length > 50
			alert("メッセージは50字以内で入力してください")
			event.target.value = ''
			event.preventDefault()
		else
			event.target.value = ''
			event.preventDefault()





