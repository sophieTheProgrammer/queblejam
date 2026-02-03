extends AudioStreamPlayer2D

func _play_music(music, volume):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()
