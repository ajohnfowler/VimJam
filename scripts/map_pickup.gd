extends Area2D
class_name map_pickup

export(int) var piece_number

func _on_MapPiece_body_entered(body):
	if (body.name == "player"):
		$Sprite.visible = false
		$CollisionShape2D.disabled = true
		$Poof.emitting = true
		yield(get_tree().create_timer(0.5), "timeout")
		PlayerVariables.CollectedMap(piece_number)
