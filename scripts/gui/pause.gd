extends Control
class_name pause

func _ready():
	resume()
	
func pause():
	get_tree().paused = true
	$Panel.visible = true
	
func resume():
	get_tree().paused = false
	$Panel.visible = false

func _input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			resume()
		else:
			pause()

func _on_Resume_pressed():
	resume()

func _on_Menu_pressed():
	SceneManager.goto_scene("res://scenes/Menu.tscn")
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit()
