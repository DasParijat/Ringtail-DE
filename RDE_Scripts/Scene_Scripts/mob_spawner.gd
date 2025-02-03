extends Node2D


func _ready() -> void:
	pass 

func spawn_mob(mob, mob_pos : Vector2) -> void:
	var mob_instance = mob.instantiate()
	
	mob_instance.global_position = mob_pos
	get_parent().get_parent().add_child(mob_instance)
