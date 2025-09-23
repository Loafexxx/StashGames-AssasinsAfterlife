extends Area2D

func _ready() -> void:
	connect("area_entered", Callable(self, "_on_Hitbox_area_entered"))

func _on_Hitbox_area_entered(area: Area2D) -> void:
	print("JUST LET ME SYD")
