extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -1000.0
const GRAVITY = 2200
const coyote_frames = 6  # How many in-air frames to allow jumping
var coyote = false  # Track whether we're in coyote time or not
var last_floor = false  # Last frame's on-floor state
var jumping = false
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
	if Input.is_action_just_pressed("Jump") and (is_on_floor() or coyote):
			velocity.y = JUMP_VELOCITY
			jumping = true
			coyote = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	last_floor = is_on_floor()
	move_and_slide()



func _on_coyote_timer_timeout() -> void:
	coyote = false
