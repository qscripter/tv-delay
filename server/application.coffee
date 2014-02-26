Meteor.startup( () ->
	if CableProviders.find().count() == 0
		providers = [
			name: "Off Air"
		,
			name: "Comcast"
		,
			name: "Time Warner"
		,
			name: "Cox Communications"
		,
			name: "Verizon FiOS"
		,
			name: "AT&T"
		,
			name: "Adelphia"
		,
			name: "Dish Network"
		,
			name: "DirecTV"
		,
			name: "RCN"
		,
			name: "Google Fiber"
		,
			name: "Bright House Networks"
		,
			name: "Cablevision"
		]

		for provider in providers
			CableProviders.insert(provider)


	qscripter = Meteor.users.findOne({"emails.0.address": "qscripter@gmail.com"})
	Roles.addUsersToRoles(qscripter._id, ['admin'])
)