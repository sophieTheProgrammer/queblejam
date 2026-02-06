extends AudioStreamPlayer2D

const CLICK = preload("res://audio/clicksound.mp3")
const HURT = preload("res://audio/hitHurt.wav")
const JUMP = preload("res://audio/jump.wav")


func play_click():
	
	var fx = AudioStreamPlayer.new()
	#fx.stream = CLICK
	fx.name = "audio effects player"
	fx.volume_db = 10
	add_child(fx)
	fx.play()
	await fx.finished
	
	fx.queue_free()

func play_hurt():
	var fx = AudioStreamPlayer.new()
	#fx.stream = HURT
	fx.name = "audio effects player"
	fx.volume_db = 10
	add_child(fx)
	fx.play()
	await fx.finished
	
	fx.queue_free()


func play_sound(stream, volume):
	var fx = AudioStreamPlayer.new()
	fx.stream = stream
	fx.name = "audio effects player"
	fx.volume_db = volume
	add_child(fx)
	fx.play()
	await fx.finished
	
	fx.queue_free()
