extends Node2D

func _on_Area2D_body_entered(body):
	if body.name == "player" and PlayerVariables.been_to_there:
		# Win the game!
		$Fountain_On.visible = true
