extends Node

const GAME = "res://RDE_Scenes/game.tscn"
const MAIN_MENU = "res://RDE_Scenes/main_menu.tscn"

const LOAD_SCENE : PackedScene = preload("res://RDE_Scenes/load_screen.tscn")

var next_scene : String
var next_level : LevelRes 

enum SceneType {FIGHT, CSCENE, MAIN_MENU}
var cur_scene_type : SceneType

# possible future vars
#var game_level : LevelRes
#var cutscene_id

func set_next_level(new_level : String) -> void:
	next_level = load(new_level)
	
func set_next_scene(new_scene : String) -> void:
	next_scene = new_scene

func load_next_scene(new_scene : String) -> void:
	set_next_scene(new_scene)
	get_tree().change_scene_to_packed(LOAD_SCENE)
