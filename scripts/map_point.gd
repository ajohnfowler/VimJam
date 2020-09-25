extends Area2D
class_name map_tile

var id
var active = true

func _on_map_tile_input_event(_viewport, event, _shape_idx):
	# Called when the mouse is released over the map tile.
	if event is InputEventMouseButton and not event.pressed and active:
		# Once player gets to new node load the level
		SceneManager.goto_level(MapGenerator.map_nodes[id].level, id)

# On mouse enter highlight
func _on_map_tile_mouse_entered():
	if active:
		$Sprite.self_modulate = Color(0,1,0)

# On mouse exit remove highlight
func _on_map_tile_mouse_exited():
	if active:
		$Sprite.self_modulate = Color(1,1,1)

func set_inactive():
	active = false
	$Sprite.self_modulate = Color(1,1,0.5,0.5)
