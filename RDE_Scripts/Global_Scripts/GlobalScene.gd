extends Node

const GAME = "uid://bi38sacvfy6xa" 
const MAIN_MENU = "uid://dgynnt6h5g1vk"
const HOME_MENU = "uid://dfwvndhpp8eyr"
const GAME_OVER = "uid://dd4jbqa68fpne"
const SETTINGS = "uid://rfijw7j5g1v2"

const LOAD_SCENE : PackedScene = preload("uid://b7ky1sqwiq4tv")

var next_scene : String
var next_level : LevelRes 
var next_level_modes : Array = []

enum SceneType {FIGHT, CSCENE, HOME_MENU, MAIN_MENU}
var cur_scene_type : SceneType

var prev_scene 
var cur_scene = MAIN_MENU

var world_scene_history : Array[PackedScene]
# possible future vars
#var game_level : LevelRes
#var cutscene_id
var cam_border_x : float
var cam_border_y : float

signal on_victory()  # Used to communicate to cam, victory menu, and fight that its on victory screen
signal off_victory()

var on_victory_screen : bool = false
var victory_fade_rate : float = 0.15

func _ready() -> void:
	GlobalScene.connect("on_victory", Callable(self, "_on_victory"))
	
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

func _on_victory() -> void:
	on_victory_screen = true
	await GlobalScene.off_victory
	on_victory_screen = false
	
