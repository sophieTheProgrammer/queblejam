extends Area2D

func _on_area_entered(_area: Area2D) -> void:
	if !Global.debug:
		get_tree().reload_current_scene()
