extends Node
class_name map

export (PackedScene) var map_point

func _ready():
	print (PlayerVariables.collected_maps)
	BuildMap()

func BuildMap():
	for node in MapGenerator.map_nodes:
		var point = map_point.instance()
		add_child(point)
		point.position = node.position
		point.id = node.id
		point.get_node("Label").set_text(node.level.capitalize())
		if node.next_node != null:
			point.get_node("Line").set_points([Vector2.ZERO, node.next_node.position-node.position])

func _on_Button_pressed():
	SceneManager.goto_scene("res://scenes/Game.tscn")
