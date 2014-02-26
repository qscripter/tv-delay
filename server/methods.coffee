Meteor.methods(
	headers: () ->
		foo = headers.get( this )
		return foo
	startCommercial: (_id) ->
		if Roles.userIsInRole(this.userId, ['admin'])
			Commercials.update({},
				$set:
					active: false
			,
				multi: true
			)
			Commercials.update(_id,
				$set:
					active: true
					startTime: new Date()
			)
	deleteCommercial: (_id) ->
		if Roles.userIsInRole(this.userId, ['admin'])
			Commercials.update(_id, {$set: {deleted: true}})
	triggerCommercial: (cableProvider, geoloc) ->
		activeId = Commercials.findOne({active: true})._id
		headerInfo = headers.get( this )
		data =
			time: new Date()
			headers: headerInfo
			cableProvider: cableProvider
			geoloc: geoloc
		if headerInfo['x-forwarded-for']
			hosts = headerInfo['x-forwarded-for'].split(",")
			url = "http://ip-api.com/json/" + hosts[hosts.length - 1]
			HTTP.get( url, (err, response) =>
				if not err
					data.ipGeoloc = JSON.parse(response.content)
				Commercials.update( activeId,
					$push:
						responses: data
				)
			)
		else
			Commercials.update( activeId,
				$push:
					responses: data
			)
)