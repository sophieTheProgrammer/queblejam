extends Node2D


func _on_restart_button_down() -> void:
	Global.load_scene(0)
	Global.Destination = 1


func _on_restart_button_up() -> void:
	SfxPlayer.play_sound(SfxPlayer.CLICK, 10)
