extends RigidBody2D

@onready var characterbody2d = $"."

var falling = false

func _physics_process(delta: float) -> void:
	print(linear_velocity.x)
	if Input.is_action_pressed("Right"):
		if linear_velocity.x < get_meta("MaxSpeed"):
			linear_velocity.x += get_meta("PlayerMovementSpeed")
			
	if Input.is_action_pressed("Left"):
		if linear_velocity.x > (get_meta("MaxSpeed") * -1):
			linear_velocity.x -= (get_meta("PlayerMovementSpeed"))
	if Input.is_action_just_released("Up"):
		linear_velocity.y -= (get_meta("JumpHeight")*50)
	angular_velocity = 0
