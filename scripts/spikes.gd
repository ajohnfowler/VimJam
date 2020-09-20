extends Area2D
class_name spikes

func _on_spikes_body_entered(body):
	if (body.name == "player"):
		# Hit Player Restart Level
		SceneManager.restart_level()
