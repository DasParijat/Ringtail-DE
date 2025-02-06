extends Node

var load_scene : PackedScene = preload("res://RDE_Scenes/load_screen.tscn")
var next_scene : String

# possible future vars
#var game_level : LevelRes
#var cutscene_id

func set_next_scene(new_scene) -> void:
	next_scene = new_scene
	
func load_next_scene(new_scene) -> void:
	set_next_scene(new_scene)
	get_tree().change_scene_to_packed(load_scene)
