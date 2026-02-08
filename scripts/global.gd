extends Node
@export var debug = false
const LEVEL_0 = preload("res://scenes/tutorial.tscn")
const LEVEL_1 = preload("res://scenes/level_1.tscn")
const LEVEL_2 = preload("res://scenes/level_2.tscn")
const LEVEL_3 = preload("res://scenes/level_3.tscn")
const START = preload("res://scenes/start.tscn")
const RESTART = preload("res://scenes/restart.tscn")
const LEVELS = [START, LEVEL_0, LEVEL_1, LEVEL_2, LEVEL_3, RESTART]
@export var Destination := 1
func load_scene(scene:int):
	#get_tree().change_scene_to_packed(LEVELS[scene])
	get_tree().call_deferred("change_scene_to_packed", LEVELS[scene])
	Global.Destination += 1
