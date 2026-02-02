extends CharacterBody2D

const SPEED = 800.0
const JUMP_VELOCITY = -1600.0
const GRAVITY = 2900

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		#velocity += get_gravity() * delta
		velocity.y +=  GRAVITY * delta
	# Handle jump.
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if not Input.is_action_pressed("Jump") and not is_on_floor():
		velocity.y -= JUMP_VELOCITY/45
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
