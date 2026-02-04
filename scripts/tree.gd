extends AnimatableBody2D 
@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var area: Area2D = $Area2D
@onready var death_timer: Timer = $"Die Timer"
@onready var respawn_timer: Timer = $"Respawn Timer"
var tree_dead := false
var tree_alive := false
var POSITION
const FALL_POSITION = 2000
const TIME_TILL_ALIVE = 4
const TIME_TILL_DEATH = 3
var speed = 700
const MAX_SPEED = 10000
const ACCELERATION = 4000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	POSITION = position.y
	print(sprite.scale)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_down"):
		position.y = POSITION
		collision.disabled = false
		area.monitoring = true
		sprite.scale = Vector2(0.5, 0.5)
		tree_alive = false
		tree_dead = false
		speed = 700
	if tree_dead == true:
		if position.y < FALL_POSITION:
			speed = move_toward(speed, MAX_SPEED, ACCELERATION * delta)
			position.y = move_toward(position.y, FALL_POSITION, speed * delta)
	if tree_alive == true:
		if sprite.scale < Vector2(0.46, 0.46):
			sprite.scale *= 1.13
		else:
			collision.disabled = false
			area.monitoring = true
			speed = 700
			tree_alive = false
func _on_area_2d_area_entered(area: Area2D) -> void:
	if death_timer.is_stopped():
		death_timer.start(TIME_TILL_DEATH)
		respawn_timer.start(TIME_TILL_ALIVE)

func _on_die_timer_timeout() -> void:
	tree_dead = true

func _on_respawn_timer_timeout() -> void:
	collision.disabled = true
	area.monitoring = false
	sprite.scale = Vector2(0.003, 0.003)
	tree_dead = false
	position.y = POSITION
	tree_alive = true
