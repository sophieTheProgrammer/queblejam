extends AnimatableBody2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var area: Area2D = $Area2D
@onready var death_timer: Timer = $"Die Timer"


var tree_dead := false
const TIME_TILL_DEATH = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if tree_dead == true:
		var tween = create_tween()
		tween.tween_property(sprite, "scale", Vector2(0.307, 0.01), 0.1).set_trans(Tween.TRANS_CUBIC)
		if sprite.scale <= Vector2(0.307001, 0.01):
			tree_dead = false
			sprite.hide()
			collision.disabled = true
			area.monitoring = false
			$ColorRect.hide()
func _on_area_2d_area_entered(_area: Area2D) -> void:
	if death_timer.is_stopped():
		death_timer.start(TIME_TILL_DEATH)

func _on_die_timer_timeout() -> void:
	#print("a")
	tree_dead = true
