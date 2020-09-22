extends Node
class_name map_generator
var map_nodes = []
var number_of_steps = 2

class MapNode:
	var id: int
	var position: Vector2
	var previous_node: MapNode
	var has_map: bool
	var level: String

func _ready():
	randomize()
	GenerateMap()

func GenerateMap():
	MakePoints()

# Recusively create points from the starting point to end
func MakePoints():
	# Make the There node
	MakeBack()
	MakeLevelNodes(map_nodes[0], number_of_steps)
	MakeThere()

func MakeBack():
	var back = MapNode.new()
	back.position = Vector2.ZERO
	back.level = "back"
	back.has_map = false
	back.id = map_nodes.size()
	map_nodes.append(back)

func MakeLevelNodes(parent, step_number):
	if step_number <= 0:
		return parent
	
	var node = MapNode.new()
	node.position = parent.position + Vector2(rand_range(100,200), rand_range(-300,300))

	node.previous_node = parent
	# For testing all levels have the same number
	node.level = 4 #rand_range(1,2)
	node.has_map = false
	node.id = map_nodes.size()
	map_nodes.append(node)
	
	# returns a random number between 1-3 for the number of forks of the node
	var splits = randi()%3+1
	match splits:
		1:
			MakeLevelNodes(node, step_number-1)
		2:
			MakeLevelNodes(node, step_number-1)
			MakeLevelNodes(node, step_number-1)
		3:
			MakeLevelNodes(node, step_number-1)
			MakeLevelNodes(node, step_number-1)
			MakeLevelNodes(node, step_number-1)
			
	return

func MakeThere():
	var there = MapNode.new()
	# Add onto the end of the last node added
	there.position = map_nodes[map_nodes.size()-1].position + Vector2(rand_range(100,200), rand_range(-300,300))
	there.level = "there"
	there.has_map = false
	there.id = map_nodes.size()
	there.previous_node = map_nodes[map_nodes.size()-1]
	map_nodes.append(there)
