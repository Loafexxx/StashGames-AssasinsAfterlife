extends RigidBody2D
var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
func _ready():
	
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()
