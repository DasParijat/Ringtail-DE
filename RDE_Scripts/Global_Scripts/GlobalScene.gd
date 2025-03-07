extends Node

const GAME = "res://RDE_Scenes/game.tscn"
const MAIN_MENU = "res://RDE_Scenes/main_menu.tscn"
const GAME_OVER = "res://RDE_Scenes/game_over.tscn"
const SETTINGS = "res://RDE_Scenes/settings_menu.tscn"

const LOAD_SCENE : PackedScene = preload("res://RDE_Scenes/load_screen.tscn")

var next_scene : String
var next_level : LevelRes 

enum SceneType {FIGHT, CSCENE, MAIN_MENU}
var cur_scene_type : SceneType

var prev_scene 
var cur_scene = MAIN_MENU

var world_scene_history : Array[PackedScene]
# possible future vars
#var game_level : LevelRes
#var cutscene_id
var cam_border_x : float
var cam_border_y : float

func set_next_level(new_level : String) -> void:
	next_level = load(new_level)
	
func set_next_scene(new_scene : String) -> void:
	next_scene = new_scene

func update_scene_history(new_scene : String) -> void:
	# TODO possibly keep whole array storing ALL previous scenes (not needed now)
	prev_scene = cur_scene
	cur_scene = new_scene
	#print("cur scene: ", cur_scene, " prev_scene: ", prev_scene)

func update_world_scene_history(new_world : PackedScene) -> void:
	if world_scene_history.size() == 0 or world_scene_history[0] != new_world:
		world_scene_history.append(new_world)
		
func load_next_scene(new_scene : String) -> void:
	update_scene_history(new_scene)
	
	set_next_scene(new_scene)
	get_tree().change_scene_to_packed(LOAD_SCENE)
