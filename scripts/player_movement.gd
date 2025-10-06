extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -150.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
# If your node is named differently, update "$AnimatedSprite2D" to match.

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		if sprite.animation != "jump":
				sprite.play("jump")
		
	# Jump
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if sprite.animation != "jump":
				sprite.play("jump")
	# Horizontal movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		# Flip sprite depending on direction
		sprite.flip_h = direction < 0
		# Play walking animation if not already playing
		if sprite.animation != "walk" and is_on_floor():
			sprite.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		# Idle animation when not moving

		if sprite.animation != "idle" and is_on_floor():
			sprite.play("idle")
	move_and_slide()
