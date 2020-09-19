extends Node

export (PackedScene) var map_point

func _ready():
	print (PlayerVariables.collected_maps)
	BuildMap()

func BuildMap():
	for node in MapGenerator.map_nodes:
		var point = map_point.instance()
		add_child(point)
		point.position = node.position
		if node.next_node != null:
			point.get_node("Line").set_points([Vector2.ZERO, node.next_node.position-node.position])

func _on_Button_pressed():
	SceneManager.goto_scene("res://scenes/Game.tscn")
