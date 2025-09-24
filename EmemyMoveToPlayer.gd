extends Area2D

@onready var playerChar = $"../../../../Player/CharacterBody2D" #Makes a variable for the players CharacterBody2D
@onready var self_rigidbody = $".." #Makes a variable for the bosses Rigidbody2D
@onready var animatedsprite = $"../AnimatedSprite2D" #Makes a variable for the animatedsprite2D

var detecting = false #detecting is checking it should detect what side the player is on and moves to them

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("area_entered", _on_area_entered) #just connects the area enterd function to the _on_area_entered func
	connect("area_exited", _on_area_exited) #just connects the area exited function to the _on_area_exited func


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if detecting:
		if get_meta("MoveX"): #sees the axispass # Replace with function body. it needs to move to (in this case X)
			if playerChar.global_position.x < self_rigidbody.global_position.x: #checks to see if the player is on the left, if they are the boss moves towards them
				self_rigidbody.linear_velocity.x = (get_meta("X_Speed")*-1) #sets the bosses X velocity
				animatedsprite.scale.x = -1 #Faces Left
				
			if playerChar.global_position.x > self_rigidbody.global_position.x: #checks to see if the player is on the right, if they are the boss moves towards them
				self_rigidbody.linear_velocity.x = get_meta("X_Speed") #sets the bosses X velocity
				animatedsprite.scale.x = 1 #Faces Rigst

				
		if get_meta("MoveY"): #sees the axis it needs to move to (in this case Y)
			if playerChar.global_position.y < self_rigidbody.global_position.y: #checks to see if the player is beneath, if they are the boss moves towards them
				self_rigidbody.linear_velocity.y = (get_meta("Y_Speed")*-1) #sets the bosses Y velocity
				
			if playerChar.global_position.y > self_rigidbody.global_position.y: #checks to see if the player is above, if they are the boss moves towards them
				self_rigidbody.linear_velocity.y = get_meta("Y_Speed") #sets the bosses Y velocity

			
	
func _on_area_entered(area: Area2D) -> void: 
	if area.is_in_group("Player"): #checks to see if the thing its touching is in the player group
		detecting = true #when the player is in range of the boss (touching the area2d called Range) it turns on detecting which locates what side to move to
		animatedsprite.play("Walking") #Play the walking animation

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("Player"): #checks to see if the thing its not touching anymore is in the player group
		detecting = false #turns off detecting
		animatedsprite.play("Idle") #Play the idle animation
