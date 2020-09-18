extends KinematicBody2D
class_name player

export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25
export var move_speed = 200
export var gravity = 200
export var jump_force = 200

var velocity = Vector2.ZERO

func _physics_process(delta):
	
	# Left and Right movement
	var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

	# Using lerp a smooth start and stop to player movement
	if direction != 0:
		velocity.x = lerp(velocity.x, direction * move_speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

	# Apply Gravity to player
	velocity.y += gravity * delta

	# Apply movement
	velocity = move_and_slide(velocity, Vector2.UP)
	
	# Add jump force when Jump is pressed
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_force
