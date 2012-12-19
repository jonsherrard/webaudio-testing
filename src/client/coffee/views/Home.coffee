class APP.v.Home extends View
	events :
		'click #play' : 'play'
		'click #stop' : 'stop'
		'click #update' : 'input_update'
	initialize : =>
		@template = 'home.html'
		@screen_append()
		@playing = false
		@global_freq = 523
		$('#freq').attr 'value', @global_freq
		$('#mover').draggable(
			containment : '#instrument'
			drag : =>
				offset = $('#mover').offset()
				@calc(offset.left, offset.top)
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
	input_update : =>
		form_value = $('#freq').attr 'value'
		@freq_update(form_value)
	
	freq_update : (freq)=>
		@global_freq = freq
		if @oscillator?
			@oscillator.frequency.value = @global_freq
		$('#freq').attr('value', @global_freq)
	calc : (x, y) =>
		y = 556-y
		x = 367.5-x
		ratio = 4
		@freq_update((y*ratio)+60)

