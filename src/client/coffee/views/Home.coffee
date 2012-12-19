class APP.v.Home extends View
	events :
		'click #play' : 'play'
		'click #stop' : 'stop'
		'click #update' : 'input_update'
	initialize : =>
		@template = 'home.html'
		@screen_append()
		@playing = false
		@global_freq = 100
		$('#freq').attr 'value', @global_freq
		$('h1#freq_text').html @global_freq
		$('#mover').draggable(
			containment : '#instrument'
			start : =>
				@play()
			stop : =>
				@stop()
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
		$('#mover').css
			background: "rgb(0,0,"+y+")"
		ratio = 2.16
		@freq_update((y*ratio)+60)
		$('h1#freq_text').html @global_freq


