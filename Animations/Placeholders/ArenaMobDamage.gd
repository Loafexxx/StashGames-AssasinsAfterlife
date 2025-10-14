extends Area2D

@onready var animatedsprite = $"../AnimatedSprite2D"


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_area_entered(body):
	if body.name == "PlayerSword Arena":
		animatedsprite.modulate("Red")
