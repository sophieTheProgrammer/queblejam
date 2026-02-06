extends CharacterBody2D

@export var SPEED = 1600.0
@export var JUMP_VELOCITY = -1900.0
@export var GRAVITY = 4000
@export var coyote_frames = 3  # How many in-air frames to allow jumping
@export var fast_fall = 80
 
var coyote = false  # Track whether we're in coyote time or not
var last_floor = false  # Last frame's on-floor state
var jumping = false
const ACCELERATION = 4000
const DECCELERATION = 4000

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	handle_jump(delta)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")

	flip_sprite(direction)
	
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION * delta)
		
	
	move_and_slide()
	
# handles jump, gravity, and includes coyote time
func handle_jump(delta):
	if is_on_floor() and jumping:
		jumping = false
	# Add the gravity.
	if not is_on_floor():
		velocity.y +=  GRAVITY * delta
	
	if last_floor and not is_on_floor() and not jumping:
		coyote = true
		$CoyoteTimer.start()
		#print("Starting Coyote Timer")
		
	# TODO: variable jump height makes character go too high
	# Handle jump.
	if Input.is_action_pressed("Jump") and (is_on_floor() or coyote):
		velocity.y += JUMP_VELOCITY
		jumping = true
		coyote = false
	
	#print(velocity.y)
	# # adding fast fall on the way down
	if not is_on_floor() and jumping:
		if not Input.is_action_pressed("Jump"):
			velocity.y += fast_fall
		if velocity.y > 0:
			velocity.y += fast_fall
	if velocity.y > 3000:
		velocity.y = 3000
	
	# jump animation here
	if jumping:
		sprite.play('floating')
	else:
		sprite.play('idle')
	
	last_floor = is_on_floor()
	
	if Input.is_action_pressed ("Jump") and last_floor:
		SfxPlayer.play_sound(SfxPlayer.JUMP, 7)
	
func flip_sprite(direction):
	if direction != 0:
		if direction == 1:
			sprite.flip_h = false
		else:
			sprite.flip_h = true

func _on_coyote_timer_timeout() -> void:
	coyote = false
#
#func _on_death_area_entered(_area: Area2D) -> void:
	#get_tree().reload_current_scene()
