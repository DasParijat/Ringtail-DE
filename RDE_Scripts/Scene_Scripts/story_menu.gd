extends Control

var selected_fight : String = "" # Get info on what fight the player is looking at from the fight buttons

func _on_playfight_b_pressed() -> void:
	if selected_fight:
		# Probably not UID this
		var fight_res_path = "res://RDE_Resources/Level Res/" + selected_fight + ".tres"
		GlobalScene.set_next_level(fight_res_path)
		GlobalScene.load_next_scene(GlobalScene.GAME)
	else:
		printerr("STORY MENU ERR: SELECTED FIGHT IS BLANK")
