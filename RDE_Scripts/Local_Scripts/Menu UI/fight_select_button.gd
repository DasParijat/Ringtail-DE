extends navButton

# TODO add script to VBoxContainer to handle adding/unlocking buttons

@export var fight_type : String
@export var is_locked : bool

func _pressed() -> void:
	# "res://RDE_Resources/Level Res/STORY_RGT_HARD.tres"
	# TODO possibly account for if non-existent fight_type is entered
	if not fight_type:
		printerr("FIGHT BUTTON ERR: NO FIGHT TYPE GIVEN")
		return
	
	if is_locked:
		print("IS LOCKED")
		return
	
	GlobalMenu.emit_signal("fight_selected_pressed", fight_type)
	#get_parent_control().get_parent_control().get_parent_control().selected_fight = fight_type
	
