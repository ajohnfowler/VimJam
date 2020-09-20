extends Node
class_name map

export (PackedScene) var map_point

var position_total = Vector2.ZERO

func _ready():
	BuildMap()
	PositionCamera()

func BuildMap():
	for node in MapGenerator.map_nodes:
		var point = map_point.instance()
		add_child(point)
		point.position = node.position
		position_total += node.position
		point.id = node.id
		point.get_node("Label").set_text(node.level.capitalize())
		if node.previous_node != null:
			point.get_node("Line").set_points([Vector2.ZERO, node.previous_node.position-node.position])

func PositionCamera():
	var central_position = position_total/MapGenerator.map_nodes.size()
	$focus_point.position = central_position

func _on_Button_pressed():
	SceneManager.goto_scene("res://scenes/Game.tscn")
