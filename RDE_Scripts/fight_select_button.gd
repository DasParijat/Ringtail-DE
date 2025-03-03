extends "res://RDE_Scripts/navButton.gd"

@export var fight_type : String


func _pressed() -> void:
	# "res://RDE_Resources/Level Res/STORY_RGT_HARD.tres"
	if not fight_type:
		print("ERROR: NO FIGHT TYPE GIVEN")
		return
		
	var fight_res_path = "res://RDE_Resources/Level Res/" + fight_type + ".tres"
	GlobalScene.set_next_level(fight_res_path)
	GlobalScene.load_next_scene(GlobalScene.GAME)
	
