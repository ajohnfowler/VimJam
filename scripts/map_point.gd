extends Area2D
class_name map_tile

var id

func _on_map_tile_input_event(viewport, event, shape_idx):
	# Called when the mouse is released over the map tile.
	if event is InputEventMouseButton and not event.pressed:
		var level_number = MapGenerator.map_nodes[id].level
		var level_scene = "res://scenes/levels/"+str(level_number)+".tscn"
		# Move player indicator to new node
		
		# Once player gets to new node load the level
		SceneManager.goto_scene(level_scene)

# On mouse enter highlight
func _on_map_tile_mouse_entered():
	$Sprite.self_modulate = Color(0,1,0)

# On mouse exit remove highlight
func _on_map_tile_mouse_exited():
	$Sprite.self_modulate = Color(1,1,1)