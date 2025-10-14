extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("area_entered", _on_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(body):
	if body.name == "PlayerSword Arena":
		print("DRAKIE PIE")
