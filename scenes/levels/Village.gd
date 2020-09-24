extends Node2D

var colors = [Color(1.0, 0.0, 0.0, 1.0),
		  Color(0.0, 1.0, 0.0, 1.0),
		  Color(0.0, 0.0, 1.0, 0.0)]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	modulate = colors[randi() % colors.size()]
