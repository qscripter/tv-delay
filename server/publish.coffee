Meteor.publish("cableProviders", () ->
	return CableProviders.find()
)

Meteor.publish("commercials", () ->
	if Roles.userIsInRole(this.userId, ['admin'])
		return Commercials.find()
)