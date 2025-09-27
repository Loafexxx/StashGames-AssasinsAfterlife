extends RigidBody2D
var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
func _ready():
	#this gets a random animation and plays it
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()
	
func _on_visible_on_screen_notifier_2d_screen_extended():
	queue_free()
	#this just completes nodes i think
