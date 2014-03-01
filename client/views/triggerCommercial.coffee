Template.triggerCommercial.cableProviders = ->
	return CableProviders.find({}, {sort: {name: 1}})

Template.triggerCommercial.triggered = ->
	return Session.get("triggered")

Template.triggerCommercial.events(
	'click #trigger': () ->
		provider = $('#cableProvider :selected').text()
		Meteor.call('triggerCommercial', provider, Session.get("geolocation"))
		Session.set("triggered", true)
)

Deps.autorun( () ->
	commercials = Commercials.find().fetch()
	Session.set("triggered", false)
)