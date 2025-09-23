extends CharacterBody2D

var accelerate_y = 0.0

func _physics_process(delta: float) -> void:
	accelerate_y += get_meta("Weight") + get_gravity().y
	if Input.is_action_pressed("Right"): #check if right is pressed
		if velocity.x < get_meta("MaxSpeed"):
			velocity.x += get_meta("PlayerMovementSpeed")
			
	if Input.is_action_pressed("Left"): #check if Left is pressed
		if velocity.x > (get_meta("MaxSpeed") * -1):
			velocity.x -= (get_meta("PlayerMovementSpeed"))
			
	if Input.is_action_just_pressed("Up"): #check if Up is pressed
		velocity.y = (get_meta("JumpHeight")*50*-1)
	move_and_slide()
	
	velocity.y = accelerate_y
	
func _on_Area2D_area_entered(area):
	print("dih")
