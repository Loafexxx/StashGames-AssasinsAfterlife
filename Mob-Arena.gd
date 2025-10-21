extends RigidBody2D

@onready var animation = $AnimatedSprite2D
@onready var player = $"../Player"
@onready var progressbar = $HealthBar

var hurtanimationclocktime = 0

var health = 100

var stuckpos = null

func _ready():
	animation.play("Run")
	
func _process(delta: float) -> void:
	if get_meta("CanMoveX"):
		if player.global_position.x > global_position.x:
			global_position.x += get_meta("Speed") * delta
			animation.flip_h = false
		else: 
			global_position.x -= get_meta("Speed") * delta
			animation.flip_h = true
			
	if get_meta("CanMoveY"):
		if player.global_position.y > global_position.y:
			global_position.y += get_meta("Speed") * delta
		else: 
			global_position.y -= get_meta("Speed") * delta
			
	if hurtanimationclocktime > 0:
		hurtanimationclocktime += 1*delta
		position = stuckpos
		if hurtanimationclocktime > 1.5:
			hurtanimationclocktime = 0
			animation.play("Run")
			



func _on_hurtbox_area_entered(area: Area2D) -> void:
		if area.is_in_group("PlayerSword Arena"):
			animation.play("Hurt")
			hurtanimationclocktime = 1
			stuckpos = position
			health -= 5 * player.get_meta("DamageBuffAmount")
			progressbar.value = health
			if health < 1:
				queue_free()
