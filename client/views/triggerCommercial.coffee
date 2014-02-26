Template.triggerCommercial.cableProviders = ->
	return CableProviders.find({}, {sort: {name: 1}})

Template.triggerCommercial.events(
	'click button': () ->
		provider = $('#cableProvider :selected').text()
		Meteor.call('triggerCommercial', provider, Session.get("geolocation"))
)