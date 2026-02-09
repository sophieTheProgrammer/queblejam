extends Node
@export var debug = false
const TUTORIAL_SCREEN = preload("res://scenes/tutorial_screen.tscn")

const LEVEL_0 = preload("res://scenes/tutorial.tscn")
const LEVEL_1 = preload("res://scenes/level_1.tscn")
const LEVEL_2 = preload("res://scenes/level_2.tscn")
const LEVEL_3 = preload("res://scenes/level_3.tscn")
const LEVEL_4 = preload("res://scenes/level_4.tscn")
const LEVEL_5 = preload("res://scenes/level_5.tscn")
const START = preload("res://scenes/start.tscn")
const RESTART = preload("res://scenes/restart.tscn")
const LEVELS = [START, TUTORIAL_SCREEN, LEVEL_0, LEVEL_1, LEVEL_2, LEVEL_3, LEVEL_4, LEVEL_5, RESTART]
@export var Destination := 1

func load_scene(scene:int):
	#get_tree().change_scene_to_packed(LEVELS[scene])
	if LEVELS[scene] == START:
		MusicPlayer.play_music(MusicPlayer.STARTING_MUSIC, 6)
	if LEVELS[scene] == TUTORIAL_SCREEN:
		MusicPlayer.play_music(MusicPlayer.STARTING_MUSIC, 6)
	else:
		MusicPlayer.play_music(MusicPlayer.SCIFI, 6)
	get_tree().call_deferred("change_scene_to_packed", LEVELS[scene])
	Global.Destination += 1
