extends Node2D

var fight_res : FightRes
var world_scene : PackedScene
 

func _on_game_fight_res_set() -> void:
	# TODO add way to not instantiate node if world already exists
	fight_res = get_parent().fight_res
	
	world_scene = fight_res.world_scene
	if has_same_world(world_scene):
		#print("has same world")
		return
	
	print("loading world")
	var world_instance = world_scene.instantiate()
	add_child(world_instance)

func has_same_world(world_scene: PackedScene) -> bool:
	if get_child_count() == 0:
		return false

	var world_name = world_scene.resource_path.get_file().get_basename()
	#print(get_child(0).name, "	packed scene name: ", world_name)
	return get_child(0).name == world_name
