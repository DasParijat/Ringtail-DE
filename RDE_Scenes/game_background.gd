extends Node2D

var fight_res : FightRes
var world_scene : PackedScene
 

func _on_game_fight_res_set() -> void:
	# TODO add way to not instantiate node if world already exists
	fight_res = get_parent().fight_res
	
	if true:
		world_scene = fight_res.world_scene
		
		var world_instance = world_scene.instantiate()
		add_child(world_instance)
