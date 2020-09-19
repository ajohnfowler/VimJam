extends Panel

func _ready():
	# Super messy way to get this
	$name.set_text(get_parent().get_parent().level_name)

func _on_Timer_timeout():
	visible = false
