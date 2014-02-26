Meteor.methods(
	headers: () ->
		foo = headers.get( this )
		console.log( foo )
		return foo
	startCommercial: (_id) ->
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
	triggerCommercial: (cableProvider) ->
		activeId = Commercials.findOne({active: true})._id
		foo = headers.get( this )
		console.log ( foo )
		data =
			time: new Date()
			headers: foo
			cableProvider: cableProvider
		Commercials.update( activeId,
			$push:
				responses: data
		)
)