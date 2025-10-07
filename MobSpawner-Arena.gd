extends RigidBody2D

var mob_types = [1, 2, 3]
var tospawn = 0

@onready var animation = $AnimatedSprite2D

func _ready():
	
	animation.play("default")
