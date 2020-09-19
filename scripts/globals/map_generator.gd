extends Node

var map_lines = []
var map_points = []
var map_sections = []
var there = []
var back = []

func GenerateMap():
	
	MakePoints()
	MakeLines()

func MakePoints():
	for x in range(0,3):
		map_lines.append([x,x])

func MakeLines():
	
	pass
