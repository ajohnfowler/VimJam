extends Control

func _process(_delta):
	for child in $NinePatchRect/HBoxContainer.get_children():
		if PlayerVariables.HasAbility(child.name):
			child.visible = true
		else:
			child.visible = false
