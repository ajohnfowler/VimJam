extends Node
class_name scene_manager

var current_scene = null
var current_level
var current_map_node

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_level(name, map_node):
	var path = "res://scenes/levels/"+str(name)+".tscn"
	current_level = path
	current_map_node = map_node
	goto_scene(path)

func restart_level():
	goto_scene(current_level)
	
func goto_scene(path):
	PlayerVariables.LevelReset()
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
