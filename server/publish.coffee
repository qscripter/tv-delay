Meteor.publish("cableProviders", () ->
	return CableProviders.find()
)

CableProviders.allow(
	insert: (userId, doc) ->
		return Roles.userIsInRole(userId, ['admin'])
	update: (userId, doc) ->
		return Roles.userIsInRole(userId, ['admin'])
	remove: (userId, doc) ->
		return Roles.userIsInRole(userId, ['admin'])
)

Meteor.publish("commercials", () ->
	if Roles.userIsInRole(this.userId, ['admin'])
		return Commercials.find({deleted: {$exists: false}})
)

Commercials.allow(
	insert: (userId, doc) ->
		return Roles.userIsInRole(userId, ['admin'])
	update: (userId, doc) ->
		return Roles.userIsInRole(userId, ['admin'])
	remove: (userId, doc) ->
		return Roles.userIsInRole(userId, ['admin'])
)