class APP.v.Home extends View
	events :
		'click #play' : 'play'
		'click #stop' : 'stop'
	initialize : =>
		@template = 'home.html'
		@screen_append()
	play : =>
		console.log 'play init'
		context = new webkitAudioContext()
		@oscillator = context.create@oscillator()
		@oscillator.type = 0
		@oscillator.frequency.value = 2000
		@oscillator.connect context.destination
		@oscillator.noteOn and @oscillator.noteOn(0)
	stop : =>
		console.log 'top init'
		@oscillator.disconnect()
