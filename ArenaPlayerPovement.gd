extends Node2D

@onready var player = $"."
@onready var SwordHitbox = $Hitbox
@onready var animatedsprite = $AnimatedSprite2D

var waiting = 0
var clock = false;
var aimdirection = 1
var swordswingclock = 0
var swordswinging = false
var swordonclock = 0;
var swordequiptclockon = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if clock:
		waiting += 1 * delta
		
	
	if Input.is_action_pressed("Down"):
		position.y += get_meta("MovementSpeed") * delta
		if not swordswinging:
			if not swordequiptclockon:
				animatedsprite.play("Running")
			else:
				animatedsprite.play("SwordRunning")
		
	if Input.is_action_pressed("Up"):
		position.y -= get_meta("MovementSpeed") * delta
		if not swordswinging:
			if not swordequiptclockon:
				animatedsprite.play("Running")
			else:
				animatedsprite.play("SwordRunning")
		
	if Input.is_action_pressed("Left"):
		position.x -= get_meta("MovementSpeed") * delta
		if not swordswinging:
			if not swordequiptclockon:
				animatedsprite.play("Running")
			else:
				animatedsprite.play("SwordRunning")
		animatedsprite.flip_h = true

	if Input.is_action_pressed("Right"):
		position.x += get_meta("MovementSpeed") * delta
		if not swordswinging:
			if not swordequiptclockon:
				animatedsprite.play("Running")
			else:
				animatedsprite.play("SwordRunning")
		animatedsprite.flip_h = false
		
	
	if Input.is_action_just_pressed("Right aim"):
		aimdirection = 1
	else:
		if Input.is_action_just_pressed("Down aim"):
			aimdirection = 2
		else:
			
			if Input.is_action_just_pressed("Left aim"):
				aimdirection = 3
				
			else:
				if Input.is_action_just_pressed("Up aim"):
					aimdirection = 4
					
		
	if Input.is_action_just_pressed("Attack"):
		swordequiptclockon = true
		
		animatedsprite.play("SwordSwing")
		swordswinging = true
		clock = true
		SwordHitbox.position.x = 0
		if aimdirection == 1:
			SwordHitbox.global_rotation_degrees = 0
		else:
			if aimdirection == 2:
				SwordHitbox.global_rotation_degrees = 90
			else:
				if aimdirection == 3:
					SwordHitbox.global_rotation_degrees = 180
				else:
					if aimdirection == 4:
						SwordHitbox.global_rotation_degrees = 270
		
	if swordequiptclockon:
		swordonclock += 1 * delta
		if swordonclock > 10:
			swordequiptclockon = false
			swordonclock = 0
	if swordswinging:
		swordswingclock += 1 * delta
		if swordswingclock > 0.33:
			swordswinging = false
			animatedsprite.play("Idle")
			swordswingclock = 0

	if waiting > 0.25:
		SwordHitbox.position.x = 200000
		waiting = 0
		clock = false
