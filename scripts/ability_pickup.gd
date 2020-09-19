extends Area2D
class_name ability_pickup

export(String, "Double Jump", "Grapple") var ability_type

func _on_ability_pickup_body_entered(body):
	PlayerVariables.PickedUpAbility(ability_type)
	$Sprite.visible = false
	$CollisionShape2D.disabled = true
	$Poof.emitting = true
	yield(get_tree().create_timer(0.5), "timeout")
	queue_free()
