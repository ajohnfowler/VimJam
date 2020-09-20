extends Node2D

export(PackedScene) var player = preload("res://actors/player.tscn")
export(PackedScene) var end_flag = preload("res://actors/end_flag.tscn")
export(String) var level_name

func _ready():
	var new_player = player.instance()
	var new_end_flag = end_flag.instance()
	
	# add the player to start and map to end
	if not PlayerVariables.been_to_there:
		new_player.position = $start.position
		new_end_flag.position = $end.position
	else:
		# Player is going back to "Back", add player to end of level and flag to start
		new_player.position = $end.position
		new_end_flag.position = $start.position
		
	add_child(new_end_flag)
	add_child(new_player)
