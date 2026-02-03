extends AnimatableBody2D 
@onready var sprite: Sprite2D = $Sprite2D
@onready var death_timer: Timer = $"Die Timer"
@onready var respawn_timer: Timer = $"Respawn Timer"
var tree_dead := false
var tree_alive := false
var POSITION
const FALL_POSITION = 2000
var speed = 700
const MAX_SPEED = 10000
const ACCELERATION = 4000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	POSITION = position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y > -200:
		print(POSITION)
	if tree_dead == true:
		if position.y < FALL_POSITION:
			speed = move_toward(speed, MAX_SPEED, ACCELERATION * delta)
			position.y = move_toward(position.y, FALL_POSITION, speed * delta)
	if tree_alive == true:
		if sprite.scale < Vector2(0.4, 0.4):
			sprite.scale *= 1.15
		else:
			tree_alive = false
func _on_area_2d_area_entered(area: Area2D) -> void:
	if death_timer.is_stopped():
		death_timer.start(5)
		respawn_timer.start(10)

func _on_die_timer_timeout() -> void:
	tree_dead = true

func _on_respawn_timer_timeout() -> void:
	sprite.scale = Vector2(0.003, 0.003)
	tree_dead = false
	position.y = POSITION
	tree_alive = true
