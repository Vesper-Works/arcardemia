class_name AudioPlayer

static func play(audio: AudioStream, volume: = 1.0) -> void :
	var audio_player: = AudioStreamPlayer2D.new()
	audio_player.stream = audio
	audio_player.volume_linear = volume
	Engine.get_main_loop().root.add_child(audio_player)
	audio_player.play()
	await audio_player.finished
	audio_player.queue_free()
	
static func play_queue(audio_queue: Array[AudioStream], volume: = 1.0) -> void :
	var audio_player: = AudioStreamPlayer2D.new()
	for audio in audio_queue:
		audio_player.stream = audio
		audio_player.volume_linear = volume
		Engine.get_main_loop().root.add_child(audio_player)
		audio_player.play()
		await audio_player.finished
	audio_player.queue_free()
	
static func play_randomised(audio: AudioStream, volume: = 1.0) -> void :
	var audio_player: = AudioStreamPlayer2D.new()
	audio_player.stream = audio
	audio_player.pitch_scale *= randf_range(0.9, 1.1)
	audio_player.volume_linear = volume
	Engine.get_main_loop().root.add_child(audio_player)
	audio_player.play()
	await audio_player.finished
	audio_player.queue_free()
	
