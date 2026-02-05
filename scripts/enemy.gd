extends CharacterBody2D
const movement_speed= 10000.0
const RESET = preload("res://scenes/level_1.tscn")
@export var Goal: Node = null
@onready var navigation: NavigationAgent2D = $NavigationAgent2D
@onready var timer: Timer = $Timer
@export var activation: Area2D
var activated : bool = false

func _ready() -> void:

	navigation.target_position = Goal.global_position

func _physics_process (delta: float) -> void:
	if !navigation.is_target_reached() and !Global.debug and activated: 
		var nav_point_direction = to_local(navigation.get_next_path_position()).normalized()
		velocity = nav_point_direction * movement_speed * delta
		print(nav_point_direction)
		move_and_slide()

func _on_timer_timeout() -> void:
	if navigation.target_position != Goal.global_position && !Global.debug:
		navigation.target_position = Goal.global_position
		timer.start()
