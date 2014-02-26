Template.triggerCommercial.events(
	'click button': () ->
		provider = $('#cableProvider :selected').text()
		Meteor.call('triggerCommercial', provider, Session.get("geolocation"))
)