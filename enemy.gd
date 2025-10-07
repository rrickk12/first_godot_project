extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -150.0
var HEALTH = 10
@onready var sprite: AnimatedSprite2D = $Fabre
# If your node is named differently, update "$AnimatedSprite2D" to match.

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite.play("idle")
	move_and_slide()
	
func take_damage(damage : int) -> void:
	if HEALTH > 0:
		HEALTH -= damage
		print("Enemy health" , HEALTH)
		if HEALTH <= 0:
			sprite.play("F")
			$CollisionShape2D.disabled = true

	
