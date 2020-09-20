extends Node
class_name map_generator

var map_nodes = []
var map_sections = []
var number_of_steps = 2
var max_node_gap

class MapNode:
	var id: int
	var position: Vector2
	var next_node: MapNode
	var previous_node: MapNode
	var level: String
	var passed: bool

func _ready():
	max_node_gap = 1920/number_of_steps
	randomize()
	GenerateMap()

func GenerateMap():
	MakePoints()

# Recusively create points from the starting point to end
func MakePoints():
	
	# Make the There node
	var there = MapNode.new()
	there.position = Vector2(0,540) + Vector2(rand_range(100,200), rand_range(-300,300))
	there.level = "back"
	there.passed = false
	there.id = map_nodes.size()
	map_nodes.append(there)
	
	MakePoint(there, number_of_steps)

func MakePoint(parent, step_number):
	if step_number <= 0:
		parent.level = "there"
		return parent
	
	var node = MapNode.new()
	node.position = parent.position + Vector2(rand_range(100,max_node_gap), rand_range(-300,300))

	parent.next_node = node
	# For testing all levels have the same number
	node.level = 1 #rand_range(1,2)
	node.id = map_nodes.size()
	map_nodes.append(node)
	MakePoint(node, step_number-1)
	return
