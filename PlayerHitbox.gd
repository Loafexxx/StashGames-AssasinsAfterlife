extends Area2D

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_Hitbox_body_entered"))

func _on_Hitbox_body_entered(body: Node2D) -> void:
	print("UWU, touched by: ", body.name)
