extends Control
class_name menu

func _on_Play_pressed():
	SceneManager.goto_scene("res://scenes/Map.tscn")

func _on_Quit_pressed():
	get_tree().quit()
