extends Node
@export var debug = false

const LEVEL_0 = preload("res://scenes/tutorial.tscn")
const LEVEL_1 = preload("res://scenes/level_1.tscn")
const LEVEL_2 = preload("res://scenes/level_2.tscn")
const START = preload("res://scenes/start.tscn")
const LEVELS = [LEVEL_0, LEVEL_1, LEVEL_2]
@export var Destination := 0
func load_scene(scene:int):
	#get_tree().change_scene_to_packed(LEVELS[scene])
	get_tree().call_deferred("change_scene_to_packed", LEVELS[scene])
	Global.Destination += 1
