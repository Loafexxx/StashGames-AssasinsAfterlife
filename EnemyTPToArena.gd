extends RigidBody2D

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Animations/Placeholders/Arena.tscn")
