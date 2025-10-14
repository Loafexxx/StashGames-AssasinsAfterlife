extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("area_entered", _on_area_entered)


func _on_area_entered(body):
	if body.name == "Boss":
		print("HI")
