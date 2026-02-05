extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_up() -> void:
	Global.load_scene(0)



func _on_start_button_down() -> void:
	SfxPlayer.play_click()

func _on_quick_start_button_up() -> void:
	Global.load_scene(1)

func _on_quick_start_button_down() -> void:
	SfxPlayer.play_click()
