extends Node2D

const START = preload("res://scenes/level_1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_up() -> void:
	get_tree().change_scene_to_packed(START)



func _on_start_button_down() -> void:
	SfxPlayer.play_click()


func _on_options_button_down() -> void:
	SfxPlayer.play_click()
