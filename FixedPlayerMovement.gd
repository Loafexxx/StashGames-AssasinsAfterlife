extends CharacterBody2D

var collision = move_and_collide
var dashing = false
var dashingclock = 0
var dashingdelay = false
var dashdelayclock = 0
var start = true

@onready var animation = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if start:
		velocity.x = 0
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if dashingdelay:
		dashdelayclock += 1 * delta
		print(dashdelayclock)
		if dashdelayclock > 0.5:
			dashingdelay = false
			dashdelayclock = 0
	
	if dashing:
		dashingclock += 1 * delta
		if dashingclock > 0.4:
			dashing = false
			dashingclock = 0
			dashingdelay = true
			
	
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = get_meta("JumpHeight")
	
	if Input.is_action_pressed("Left"):
		velocity.x = get_meta("PlayerMovementSpeed") * -1
		animation.play("Walking")
		animation.flip_h = true
	else:
		if Input.is_action_pressed("Right"):
			velocity.x = get_meta("PlayerMovementSpeed")
			animation.play("Walking")
			animation.flip_h = false
		else:
				velocity.x = 0
				if not dashing:
					animation.play("Idle")
			
	if Input.is_action_just_pressed("Dash"):
		if not dashingdelay:
			position.x += get_meta("DashSpeed")
			animation.play("Dash")
			dashing = true
		

	move_and_slide()
