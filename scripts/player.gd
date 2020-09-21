extends KinematicBody2D
class_name player

export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25
export var move_speed = 400
export var gravity = 1000
var applied_gravity = gravity
export var jump_force = 200
var can_jump = false
var jump_count

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
	velocity.y += applied_gravity * delta

	# Apply movement
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		reset_jump()
	
	# Add jump force when Jump is pressed
	if Input.is_action_just_pressed("jump") and can_jump:
		velocity.y = -jump_force
		#$JumpPoof.emitting = true
		# Reduce the amount of jumps left by 1
		jump_count -= 1
		if jump_count <= 0:
			can_jump = false

func reset_jump():
	# If player has double jump, can jump twice
	if PlayerVariables.collected_abilities.has("Double Jump"):
		jump_count = 2
	# Otherwise they can only jump once
	else:
		jump_count = 1
	can_jump = true

func _on_wall_detection_body_entered(body):
	print (body.name)
	if body.name != "player":
		# Code for wall jump
		applied_gravity = 0
		velocity.y = 0

func _on_wall_detection_body_exited(body):
	if body.name != "player":
		# Code for wall jump
		applied_gravity = gravity
