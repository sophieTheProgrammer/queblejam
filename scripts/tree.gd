extends AnimatableBody2D
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var area: Area2D = $Area2D
@onready var death_timer: Timer = $"Die Timer"
var tree_dead := false
var PLAY_ANIMATION = 1
const TIME_TILL_DEATH = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if tree_dead == true:
		PLAY_ANIMATION = PLAY_ANIMATION
func _on_area_2d_area_entered(_area: Area2D) -> void:
	if death_timer.is_stopped():
		death_timer.start(TIME_TILL_DEATH)
		

func _on_die_timer_timeout() -> void:
	#print("a")
	tree_dead = true
	collision.disabled = true
	area.monitoring = false
