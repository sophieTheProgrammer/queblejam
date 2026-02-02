extends CharacterBody2D

const SPEED = 1200.0
const JUMP_VELOCITY = -1900.0
const GRAVITY = 4000
const coyote_frames = 6  # How many in-air frames to allow jumping
var coyote = false  # Track whether we're in coyote time or not
var last_floor = false  # Last frame's on-floor state
var jumping = false
const ACCELERATION = 4000
const DECCELERATION = 4000
@onready var sprite = $Sprite2D
func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	if is_on_floor() and jumping:
		jumping = false
	# Add the gravity.
	if not is_on_floor():
		velocity.y +=  GRAVITY * delta
	
	
	if last_floor and not is_on_floor() and not jumping:
		coyote = true
		$CoyoteTimer.start()
		print("Starting Coyote Timer")
	# Handle jump.
	if Input.is_action_pressed("Jump") and (is_on_floor() or coyote):
		velocity.y = JUMP_VELOCITY
		jumping = true
		coyote = false
	if not Input.is_action_pressed("Jump") and not is_on_floor():
		velocity.y -= JUMP_VELOCITY/25
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	
	if direction != 0:
		if direction == 1:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION * delta)
		#velocity = velocity.move_toward(SPEED, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION * delta)
		last_floor = is_on_floor()
	move_and_slide()



func _on_coyote_timer_timeout() -> void:
	coyote = false
