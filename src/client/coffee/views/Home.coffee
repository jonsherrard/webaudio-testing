class APP.v.Home extends View
	events :
		'click #play' : 'play'
		'click #stop' : 'stop'
		'click #update' : 'freq_update'
	initialize : =>
		@template = 'home.html'
		@screen_append()
		@playing = false
		@global_freq = 523
		$('#mover').draggable(
			containment : '#instrument'
			drag : ->
				offset = $(@).offset()
				console.log offset
		)
		
	play : =>
		unless @playing
			context = new webkitAudioContext()
			@oscillator = context.createOscillator()
			@oscillator.type = 1
			@oscillator.frequency.value = @global_freq
			@oscillator.connect context.destination
			@oscillator.noteOn and @oscillator.noteOn(0)
			@playing = true
	stop : =>
		@playing = false
		@oscillator.disconnect()
	freq_update : =>
		@global_freq = $('#freq').attr 'value'
		if @oscillator?
			@oscillator.frequency.value = @global_freq
	drag : =>
		console.log $('#mover').offset()
		
