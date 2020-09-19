extends Node
class_name player_varaibles

var collected_maps = []
var abilities = []
var current_level = 0
# Used to determine if player has reached "Back"
# if so then all levels are reversed
var been_to_back = false

func CollectedMap(piece):
	collected_maps.append(piece)
	SceneManager.goto_scene("res://scenes/Map.tscn")

func PickedUpAbility(ability):
	if not abilities.has(ability):
		abilities.append(ability)
