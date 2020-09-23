extends Area2D
class_name end_flag

func _on_MapPiece_body_entered(body):
	# Check that the body entered is the player
	if (body.name == "player"):
		body.Lock()
		yield(get_tree().create_timer(0.5), "timeout")
		PlayerVariables.CompletedLevel()
		SceneManager.goto_scene("res://scenes/Map.tscn")
