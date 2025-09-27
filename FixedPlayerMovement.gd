extends CharacterBody2D

var collision = move_and_collide

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
#test
	# Handle jump.
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = get_meta("JumpHeight")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * get_meta("PlayerMovementSpeed")
	else:
		velocity.x = move_toward(velocity.x, 0, get_meta("PlayerMovementSpeed"))

	move_and_slide()
