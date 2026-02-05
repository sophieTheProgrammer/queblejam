extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	print(Global.Destination)

func _on_area_2d_area_entered(_area: Area2D) -> void:
	Global.load_scene(Global.Destination)
