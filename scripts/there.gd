extends Node2D

export(PackedScene) var player = preload("res://actors/player.tscn")
export(PackedScene) var end_flag = preload("res://actors/end_flag.tscn")
export(String) var level_name

func _ready():
	var new_player = player.instance()
	new_player.position = $start.position
	add_child(new_player)

func add_exit():
	var new_end_flag = end_flag.instance()
	new_end_flag.position = $start.position
	add_child(new_end_flag)


func _on_Objective_body_entered(body):
	if body.name == "player":
		add_exit()
		PlayerVariables.ReachedThere()
