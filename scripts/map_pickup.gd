extends Area2D
class_name map_pickup

func _ready():
	if MapGenerator.map_nodes[SceneManager.current_map_node].has_map:
		queue_free()

func _on_MapPiece_body_entered(body):
	if (body.name == "player"):
		PlayerVariables.FoundMap()
		$Sound.play()
		$Sprite.visible = false
		$Poof.emitting = true
		yield(get_tree().create_timer(0.5), "timeout")
		queue_free()
