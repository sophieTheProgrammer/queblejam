extends CharacterBody2D
const movement_speed= 3.0
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
	if !navigation.is_target_reached() and !Global.debug and activated: 
		position = position.move_toward(Goal.global_position, movement_speed * 100 * delta)
		
func _on_timer_timeout() -> void:
	if navigation.target_position != Goal.global_position && !Global.debug and activated:
		navigation.target_position = Goal.global_position
		look_at(Goal.global_position)
	timer.start()

func activate(_body):
	#print("wow")
	activated = true
