extends RigidBody2D

@onready var animation = $AnimatedSprite2D
@onready var player = $"../Player"

func _ready():
	animation.play("Run")
	
func _process(delta: float) -> void:
	if get_meta("CanMoveX"):
		if player.global_position.x > global_position.x:
			global_position.x += get_meta("Speed") * delta
			animation.flip_h = false
		else: 
			global_position.x -= get_meta("Speed") * delta
			animation.flip_h = true
			
	if get_meta("CanMoveY"):
		if player.global_position.y > global_position.y:
			global_position.y += get_meta("Speed") * delta
		else: 
			global_position.y -= get_meta("Speed") * delta
