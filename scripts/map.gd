extends Node

var map_tiles = []

func _ready():
	print (PlayerVariables.collected_maps)
	# Generate map for testing here
	MapGenerator.GenerateMap()

func _on_Button_pressed():
	SceneManager.goto_scene("res://scenes/Game.tscn")
