extends AudioStreamPlayer2D
const CLICK = preload("res://audio/clicksound.mp3")
const HURT = preload("res://audio/hitHurt.wav")

func play_click():
	stream = CLICK
	volume_db = 10
	play()

func play_hurt():
	stream = HURT
	volume_db = 5
	play()
