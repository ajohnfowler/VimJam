extends Node

var map_nodes = []
var map_sections = []
var number_of_steps = 4
var max_node_gap

class MapNode:
	var position: Vector2
	var next_node: MapNode
	var previous_node: MapNode
	var map_option: int
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
	there.map_option = 1
	there.passed = false
	map_nodes.append(there)
	
	MakePoint(there, number_of_steps)

func MakePoint(parent, step_number):
	if step_number <= 0:
		return parent
	
	var node = MapNode.new()
	node.position = parent.position + Vector2(rand_range(100,max_node_gap), rand_range(-300,300))

	parent.next_node = node
	map_nodes.append(node)
	MakePoint(node, step_number-1)
	return

func MakeLines(start,end):
	
	pass
