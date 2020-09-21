extends Area2D
class_name map_tile

var id

func _on_map_tile_input_event(_viewport, event, _shape_idx):
	# Called when the mouse is released over the map tile.
	if event is InputEventMouseButton and not event.pressed:
		# Once player gets to new node load the level
		SceneManager.goto_level(MapGenerator.map_nodes[id].level, id)

# On mouse enter highlight
func _on_map_tile_mouse_entered():
	$Sprite.self_modulate = Color(0,1,0)

# On mouse exit remove highlight
func _on_map_tile_mouse_exited():
	$Sprite.self_modulate = Color(1,1,1)
