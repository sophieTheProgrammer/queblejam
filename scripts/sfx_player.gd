extends AudioStreamPlayer2D
const CLICK = preload("res://audio/clicksound.mp3")

func play_click():
	stream = CLICK
	volume_db = 10
	play()
