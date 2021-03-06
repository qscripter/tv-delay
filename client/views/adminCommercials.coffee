Template.adminCommercials.commercials = () ->
	return Commercials.find({}, {sort: {name: 1}})

Template.adminCommercials.timeDiff = (parent) ->
	return Math.round((this.time - parent.startTime) / 1000)

Template.adminCommercials.events(
	'click .start': ->
		Meteor.call( 'startCommercial', this._id )
	'click .delete': ->
		Meteor.call( 'deleteCommercial', this._id )
)