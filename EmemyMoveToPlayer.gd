extends Area2D

@onready var player = $"../../../../Player"
@onready var playerChar = $"../../../../Player/CharacterBody2D"
@onready var self_rigidbody = $".."

var canmove = false
var left = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("area_entered", _on_area_entered)
	connect("area_exited", _on_area_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if canmove:
		if left:
			self_rigidbody.linear_velocity.x = get_meta("X_Speed")
			
	
func _on_area_entered(area: Area2D) -> void:
	if get_meta("MoveX"):
		if playerChar.position.x > position.x:
			print("Right")
			canmove = true
			left = false
		if playerChar.position.x < position.x:
			print("Left")
			canmove = true
			left = true

	if get_meta("MoveY"):
		if playerChar.position.y > position.y:
			print("Down")
			canmove = true
			left = false
		if playerChar.position.y < position.y:
			print("Up")
			canmove = true
			left = true

func _on_area_exited(area: Area2D) -> void:
	canmove = false
	print("SMD")
