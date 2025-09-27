extends Node2D

@onready var player = $"."
@onready var SwordHitbox = $Hitbox

var waiting = 0
var clock = false;
var direction = 1;

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if clock:
		waiting += 1 * delta
	
	if Input.is_action_pressed("Down"):
		position.y += get_meta("MovementSpeed") * delta
		direction = 2
		
	if Input.is_action_pressed("Up"):
		position.y -= get_meta("MovementSpeed") * delta
		direction = 4
		
	if Input.is_action_pressed("Left"):
		position.x -= get_meta("MovementSpeed") * delta
		direction = 3
		
	if Input.is_action_pressed("Right"):
		position.x += get_meta("MovementSpeed") * delta
		direction = 1
		
		
	if Input.is_action_just_pressed("Attack"):
		clock = true
		SwordHitbox.position.x = 0
		if direction == 1:
			player.global_rotation_degrees = 0
		else:
			if direction == 2:
				player.global_rotation_degrees = 90
			else:
				if direction == 3:
					player.global_rotation_degrees = 180
				else:
					if direction == 4:
						player.global_rotation_degrees = 270

	if waiting > 0.25:
		SwordHitbox.position.x = 200000
		waiting = 0
		clock = false
