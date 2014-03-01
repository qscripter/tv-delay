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
	else
		return Commercials.find({active: true}, {fields: {responses: 0}})
)

Commercials.allow(
	insert: (userId, doc) ->
		return Roles.userIsInRole(userId, ['admin'])
	update: (userId, doc) ->
		return Roles.userIsInRole(userId, ['admin'])
	remove: (userId, doc) ->
		return Roles.userIsInRole(userId, ['admin'])
)