Template.headers.headers = () ->
	Meteor.call( "headers", (err, result) ->
		console.log( result )
	)