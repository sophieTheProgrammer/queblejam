extends Node
@export var debug = false

#const LEVEL_0 = preload("res://scenes/tutorial.tscn")
const LEVEL_1 = preload("res://scenes/level_1.tscn")
const LEVEL_2 = preload("res://scenes/testing.tscn")
const START = preload("res://scenes/start.tscn")

func load_scene(scene:int):
	match scene:
		#0:
			#get_tree().change_scene_to_packed(LEVEL_0)
		1:
			get_tree().change_scene_to_packed(LEVEL_1)
		2:
			get_tree().change_scene_to_packed(LEVEL_2)
