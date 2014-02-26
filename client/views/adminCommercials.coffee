Template.adminCommercials.commercials = () ->
	return Commercials.find()

Template.adminCommercials.timeDiff = (parent) ->
	return (this.time - parent.startTime) / 1000

Template.adminCommercials.events(
	'click button': ->
		Meteor.call( 'startCommercial', this._id )
)