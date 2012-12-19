class APP.v.Home extends View
	events :
		'click #play' : 'play'
		'click #stop' : 'stop'
	initialize : =>
		@template = 'home.html'
		@screen_append()
		@playing = false
	play : =>
		unless @playing
			context = new webkitAudioContext()
			@oscillator = context.createOscillator()
			@oscillator.type = 0
			@oscillator.frequency.value = 2000
			@oscillator.connect context.destination
			@oscillator.noteOn and @oscillator.noteOn(0)
			@playing = true
	stop : =>
		@playing = false
		@oscillator.disconnect()
