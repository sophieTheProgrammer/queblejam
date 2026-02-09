extends Node2D


func _on_restart_button_down() -> void:
	SfxPlayer.play_sound(SfxPlayer.CLICK, 10)

func _on_restart_button_up() -> void:
	Global.load_scene(0)
	Global.Destination = 1
