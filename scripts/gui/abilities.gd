extends Control

func _process(delta):
	for child in $Panel/HBoxContainer.get_children():
		if PlayerVariables.HasAbility(child.name):
			child.visible = true
		else:
			child.visible = false
