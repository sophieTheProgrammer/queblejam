extends AudioStreamPlayer2D

const CLICK = preload("res://audio/clicksound.mp3")
const HURT = preload("res://audio/hitHurt.wav")
const JUMP = preload("res://audio/jump.wav")

func play_sound(Stream, Volume):
	var fx = AudioStreamPlayer.new()
	fx.stream = Stream
	fx.name = "audio effects player"
	fx.volume_db = Volume
	add_child(fx)
	fx.play()
	await fx.finished
	
	fx.queue_free()
