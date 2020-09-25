extends Node
class_name map

export (PackedScene) var map_point

var position_total = Vector2.ZERO

func _ready():
	BuildMap()
	PositionCamera()
	PositionIndicator()

func BuildMap():
	position_total = Vector2.ZERO
	for i in MapGenerator.map_nodes.size():
		var node = MapGenerator.map_nodes[i]
		# if the map node is not revealed yet. The node is not added
		if i != 0:
			if not node.previous_node.has_map: return
		var point = map_point.instance()
		add_child(point)
		point.position = node.position
		point.id = node.id
		point.get_node("Label").set_text(node.level.capitalize())
		if node.previous_node != null:
			point.get_node("Line").set_points([Vector2.ZERO, node.previous_node.position-node.position])

func PositionCamera():
	for i in MapGenerator.map_nodes.size():
		var node = MapGenerator.map_nodes[i]
		# if the map node is not revealed yet. The node is not added
		position_total += node.position
	var central_position = position_total/(MapGenerator.map_nodes.size())
	$focus_point.position = central_position

func PositionIndicator():
	$MapIndicator.position = MapGenerator.map_nodes[SceneManager.current_map_node].position

func _on_Button_pressed():
	SceneManager.goto_scene("res://scenes/Game.tscn")
