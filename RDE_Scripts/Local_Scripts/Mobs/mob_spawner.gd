class_name MobSpawner
extends Node2D
# This node is for mobs / entities that handle spawning of other mobs
# Dev Note 2/2/25: Surprisingly light num of code to get it working
var is_on_victory : bool = false

func _ready() -> void:
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	
func spawn_mob(mob : PackedScene, mob_pos : Vector2) -> void:
	#print("spawn mob pos: ", mob_pos)
	if GMobHandler.num_of_mobs >= GMobHandler.MOB_LIMIT or is_on_victory:
		#print("BREAKING MOB LIMIT")
		return
		
	var mob_instance : Node2D = mob.instantiate()
	mob_instance.global_transform = global_transform
	mob_instance.global_position = mob_pos
	#print(mob_instance.global_position)
	
	#print("num of boss: ", GMobHandler.num_of_bosses, " num of mobs: ", GMobHandler.num_of_mobs)
	get_parent().get_parent().add_child(mob_instance)

func _on_game_won() -> void:
	is_on_victory = true
	await GlobalScene.off_victory
	is_on_victory = false
