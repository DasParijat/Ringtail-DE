extends Node2D

@export var camera_2d : Camera2D

var cutscene_res : CutsceneRes

func _on_game_cutscene_res_set() -> void:
	cutscene_res = get_parent().cutscene_res
	
	if get_child_count() > 0:
		for child in get_children():
			child.queue_free()
	
	var cutscene = cutscene_res.base_cutscene
	
	add_child(cutscene.instantiate())
