extends AudioStreamPlayer2D
const STARTING_MUSIC = preload("uid://duyynbo0t2qs")
const SCIFI = preload("res://audio/scifi.mp3")

var current_player = null
func _ready():
	play_music(MusicPlayer.STARTING_MUSIC, 6)

func play_music(Stream, Volume):
	if current_player:
		current_player.queue_free()
	if Stream == stream:
		return
	var fx = AudioStreamPlayer.new()
	fx.stream = Stream
	fx.name = "audio effects player"
	fx.volume_db = Volume
	add_child(fx)
	fx.play()
	current_player = fx
	await fx.finished
	
	fx.queue_free()
	
