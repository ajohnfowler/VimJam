extends Node
class_name player_varaibles

var collected_maps = []
var collected_abilities = []

var found_map = false
var held_abilities = []
# Used to determine if player has reached "Back"
# if so then all levels are reversed
var been_to_there = false

func FoundMap():
	found_map = true

func PickedUpAbility(ability):
	if not held_abilities.has(ability):
		held_abilities.append(ability)

func HasAbility(ability_name):
	var result = (collected_abilities.has(ability_name) or held_abilities.has(ability_name))
	return result

func CompletedLevel():
	for ability in held_abilities:
		if not collected_abilities.has(ability):
			collected_abilities.append(ability)
	held_abilities = []
	
	if not MapGenerator.map_nodes[SceneManager.current_map_node].has_map:
		MapGenerator.map_nodes[SceneManager.current_map_node].has_map = found_map
	found_map = false

func LevelReset():
	held_abilities = []
	found_map = false

func ReachedThere():
	been_to_there = true
