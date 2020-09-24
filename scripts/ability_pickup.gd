extends Area2D
class_name ability_pickup

export(String, "Double Jump", "Wall Jump", "Dash", "Flux") var ability_type

# Wrong way to do this but it works
var images = {
	"Double Jump": preload("res://sprites/Abilities/Double Jump.png"),
	"Wall Jump": preload("res://sprites/Abilities/Wall Jump.png"),
	"Dash": preload("res://sprites/Abilities/Dash.png"),
	"Flux": preload("res://sprites/Abilities/Flux.png")
}

func _ready():
	if PlayerVariables.HasAbility(ability_type):
		queue_free()
	$Sprite.texture = images[ability_type]

func _on_ability_pickup_body_entered(body):
	# Check that the body entered is the player
	if (body.name == "player"):
		PlayerVariables.PickedUpAbility(ability_type)
		$Sprite.visible = false
		$Poof.emitting = true
		$Sound.play()
		yield(get_tree().create_timer(0.5), "timeout")
		queue_free()
