extends Area2D
class_name ability_pickup

export(String, "Double Jump", "Grapple", "Wall Jump", "Dash") var ability_type

func _ready():
	if PlayerVariables.HasAbility(ability_type):
		queue_free()

func _on_ability_pickup_body_entered(body):
	# Check that the body entered is the player
	if (body.name == "player"):
		PlayerVariables.PickedUpAbility(ability_type)
		$Sprite.visible = false
		$Poof.emitting = true
		yield(get_tree().create_timer(0.5), "timeout")
		queue_free()
