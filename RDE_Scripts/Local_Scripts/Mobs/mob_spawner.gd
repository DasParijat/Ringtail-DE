class_name MobSpawner
extends Node2D
# This node is for mobs / entities that handle spawning of other mobs
# Dev Note 2/2/25: Surprisingly light num of code to get it working

func spawn_mob(mob : PackedScene, mob_pos : Vector2) -> void:
	#print("spawn mob pos: ", mob_pos)
	if GMobHandler.num_of_mobs >= GMobHandler.MOB_LIMIT:
		#print("BREAKING MOB LIMIT")
		return
		
	var mob_instance = mob.instantiate()
	mob_instance.global_position = mob_pos
	#print(mob_instance.global_position)
	
	#print("num of boss: ", GMobHandler.num_of_bosses, " num of mobs: ", GMobHandler.num_of_mobs)
	get_parent().get_parent().add_child(mob_instance)
