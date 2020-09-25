extends Node2D

func _on_Area2D_body_entered(body):
	if body.name == "player":
		if PlayerVariables.been_to_there:
			# Win the game!
			$Fountain_On.visible = true
			body.Lock()
			get_parent().get_node("ui/win_screen").visible = true
		else:
			get_node("Prompt").visible = true


func _on_Area2D_body_exited(body):
	if body.name == "player":
		get_node("Prompt").visible = false
