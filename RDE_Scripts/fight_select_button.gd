extends "res://RDE_Scripts/navButton.gd"

# TODO add script to VBoxContainer to handle adding/unlocking buttons

@export var fight_type : String
@export var is_locked : bool

func _pressed() -> void:
	# "res://RDE_Resources/Level Res/STORY_RGT_HARD.tres"
	# TODO possibly account for if non-existent fight_type is entered
	if not fight_type:
		print("ERROR: NO FIGHT TYPE GIVEN")
		return
	
	if is_locked:
		print("IS LOCKED")
		return
	
	# Probably not UID this
	get_parent_control().get_parent_control().get_parent_control().selected_fight = fight_type
	var fight_res_path = "res://RDE_Resources/Level Res/" + fight_type + ".tres"
	GlobalScene.set_next_level(fight_res_path)
	GlobalScene.load_next_scene(GlobalScene.GAME)
	
