extends CharacterBody2D
const movement_speed= 300.0
@export var Goal: Node = null
@onready var navigation: NavigationAgent2D = $NavigationAgent2D
@onready var timer: Timer = $Timer
@export var activation: Area2D
@export var activated : bool = true

func _ready() -> void:
	if activation:
		activation.body_entered.connect(activate)
	navigation.target_position = Goal.global_position
	
func _physics_process (delta: float) -> void:
	navigate(delta)

func activate(_body):
	#print("wow")
	activated = true

func navigate(delta: float):
	if activated and !navigation.is_target_reached():
		var next_path_pos = navigation.get_next_path_position()
		var new_velocity = global_position.direction_to(next_path_pos)*movement_speed
		position+=new_velocity*delta
		$animated_sprite.rotation = new_velocity.angle()
		$animated_sprite.rotation -= PI/2

func _on_timer_timeout() -> void:
	navigation.target_position = Goal.global_position
	$Timer.start()
