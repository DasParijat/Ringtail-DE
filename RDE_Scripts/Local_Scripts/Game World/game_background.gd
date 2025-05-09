extends Node2D

@onready var canvas_mod : CanvasModulate = get_child(0)

var fight_res : FightRes
var world_scene : PackedScene

## Stores world's canvas color, for when canvas color needs to be changed temporarily
var default_canvas_mod : Color 

func _ready() -> void:
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	
	if GlobalScene.prev_scene == GlobalScene.MAIN_MENU:
		#print("RESET WS HISTORY")
		GlobalScene.world_scene_history = []
	
func _on_game_fight_res_set() -> void:
	fight_res = get_parent().fight_res
	world_scene = fight_res.world_scene
	
	# If no world scene in first part of level, have blank world
	# Else, load the given world or keep / reload the previous world
	if world_scene:
		create_world()
	elif GlobalScene.world_scene_history.size() > 0:
		world_scene = GlobalScene.world_scene_history[0]
		create_world()
		
	#print("WS History: ", GlobalScene.world_scene_history)
	
func create_world() -> void:
	print("loading world")
	if has_same_world(world_scene): return
	clear_current_world()
	
	GlobalScene.update_world_scene_history(world_scene)
	var world_instance = world_scene.instantiate()
	add_child(world_instance)
	
	#print("WI COLOR: ", world_instance.base_canvas_mod)
	default_canvas_mod = world_instance.base_canvas_mod
	canvas_mod.color = default_canvas_mod
	
	
func clear_current_world() -> void:
	if get_child_count() <= 1:
		return # Nothing useless to delete
	
	#print("cleared world")
	for child_node in get_children():
		if child_node is not CanvasModulate:
			child_node.queue_free()
	
func has_same_world(world_scene: PackedScene) -> bool:
	#print("HAS SAME WORLD FUNC USED!!")
	if get_child_count() == 0:
		return false
		
	var world_name = world_scene.resource_path.get_file().get_basename()
	#print(get_child(1).name, "	packed scene name: ", world_name)
	return get_child(1).name == world_name
	

func _on_game_pause() -> void:
	## Set screen to gray-ish on pause
	if not GlobalTime.photo_enabled:
		canvas_mod.color = Color(0.5, 0.5, 0.5, 1)

func _on_game_unpause() -> void:
	## Reset color on unpause
	canvas_mod.color = default_canvas_mod

func _on_game_won() -> void:
	canvas_mod.color = Color(0.4, 0.4, 0.4, 1)
	await GlobalScene.off_victory
	canvas_mod.color = default_canvas_mod
