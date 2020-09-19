extends Node
class_name player_varaibles

var collected_maps = []
var abilities = []

func CollectedMap(piece):
	collected_maps.append(piece)
	SceneManager.goto_scene("res://scenes/Map.tscn")

func PickedUpAbility(ability):
	if not abilities.has(ability):
		abilities.append(ability)
