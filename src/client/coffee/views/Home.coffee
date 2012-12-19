class APP.v.Home extends View
	events :
		'click #play' : 'play'
		'click #stop' : 'stop'
		'click #update' : 'freq_update'
	initialize : =>
		@template = 'home.html'
		@screen_append()
		@playing = false
	play : =>
		unless @playing
			context = new webkitAudioContext()
			@oscillator = context.createOscillator()
			@oscillator.type = 1
			@oscillator.frequency.value = 523.251
			@oscillator.connect context.destination
			@oscillator.noteOn and @oscillator.noteOn(0)
			@playing = true
	stop : =>
		@playing = false
		@oscillator.disconnect()
	freq_update : =>
		@oscillator.frequency.value = $('#freq').attr 'value'
