extends Node
class_name player_varaibles

var collected_maps = []
var collected_abilities = []

var held_map
var held_ability
# Used to determine if player has reached "Back"
# if so then all levels are reversed
var been_to_there = false

func CollectedMap(piece):
	held_map = piece
	collected_maps.append(piece)

func PickedUpAbility(ability):
	held_ability = ability
	if not collected_abilities.has(ability):
		collected_abilities.append(ability)

func HasAbility(ability_name):
	var result = (collected_abilities.has(ability_name) or held_ability == ability_name)
	return result

func CompletedLevel():
	collected_maps.append(held_map)
	collected_abilities.append(held_ability)

func ReachedThere():
	been_to_there = true
