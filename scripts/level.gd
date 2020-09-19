extends Node2D

export(PackedScene) var player
export(PackedScene) var map_piece
export(PackedScene) var end_flag
export(String) var level_name
export(String, "Forward", "Backwards") var level_direction

func _ready():
	var new_player = player.instance()
	
	# add the player to start and map to end
	if level_direction == "Forward":
		var new_map_piece = map_piece.instance()
		new_player.position = $start.position
		new_map_piece.position = $end.position
		add_child(new_map_piece)
	else:
		# Player is going back to "There", add player to end of level and flag to start
		var new_end_flag = end_flag.instance()
		new_player.position = $end.position
		new_end_flag.position = $start.position
		add_child(new_end_flag)
		
	add_child(new_player)
