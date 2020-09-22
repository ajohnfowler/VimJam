extends KinematicBody2D
class_name player

export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25
export var move_speed = 400
export var gravity = 1000
var applied_gravity = gravity
export var jump_force = 200
export var wall_jump_force = 2000
export var dash_force = 200
var can_jump = false
var jump_count
var wall_detected
var can_dash = false

var velocity = Vector2.ZERO

func _physics_process(delta):
	
	# Left and Right movement
	var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

	$wall_detection.scale.x = direction

	# Using lerp a smooth start and stop to player movement
	if direction != 0:
		velocity.x = lerp(velocity.x, direction * move_speed, acceleration)
		# Play the walking animation since the move keys are pressed
		$Sprite.set_flip_h(direction < 0)
		$AnimationPlayer.play("Walking")
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		# Play the idle animation since the no move keys are pressed
		$AnimationPlayer.play("Idle")

	# Apply Gravity to player
	velocity.y += applied_gravity * delta

	# Apply movement
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		reset_jump()
		reset_dash()
	else:
		$AnimationPlayer.play("Jump")
	
	# Add jump force when Jump is pressed
	if Input.is_action_just_pressed("jump") and can_jump:
		velocity.y = -jump_force
		applied_gravity = gravity
		if wall_detected == true:
			velocity.x = wall_jump_force * -direction
		#$JumpPoof.emitting = true
		# Reduce the amount of jumps left by 1
		jump_count -= 1
		if jump_count <= 0:
			can_jump = false
	
	#add dash force when dash is pressed
	if Input.is_action_just_pressed("dash") and can_dash:
		velocity.x = dash_force * direction
		

func reset_jump():
	# If player has double jump, can jump twice
	if PlayerVariables.HasAbility("Double Jump"):
		jump_count = 2
	# Otherwise they can only jump once
	else:
		jump_count = 1
	can_jump = true

func reset_dash():
	# if player has dash ability, it allows them to dash
	if PlayerVariables.HasAbility("Dash"):
		can_dash = true 
	else:
		pass

func _on_wall_detection_body_entered(body):
	if body.name != "player" and PlayerVariables.HasAbility("Wall Jump"):
		# Code for wall jump
		wall_detected = true
		applied_gravity = 0
		velocity.y = 0
		reset_jump()

func _on_wall_detection_body_exited(body):
	if body.name != "player":
		# Code for wall jump
		wall_detected = false
		applied_gravity = gravity
