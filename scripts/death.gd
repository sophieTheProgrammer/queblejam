extends Area2D

func _on_area_entered(_area: Area2D) -> void:
	if !Global.debug:
		#print("yipppe")
		SfxPlayer.play_sound(SfxPlayer.HURT, 10)
		get_tree().call_deferred("reload_current_scene")
