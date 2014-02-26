Template.triggerCommercial.events(
	'click button': () ->
		Meteor.call('triggerCommercial', 'Verizon')
)