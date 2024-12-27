extends Control
# Code handling the whole main menu, including it's submenus
# Settings Menu is excluded, handled by it's own script

func _ready() -> void:
	# get_viewport().size = DisplayServer.screen_get_size()
	pass
	
# front_menu buttons
func _on_play_b_pressed() -> void:
	# will open up play_menu
	get_tree().change_scene_to_file("res://RDE_Scenes/game.tscn")
	
func _on_settings_b_pressed() -> void:
	# will show settings_menu (seperate scene)
	# ideally, opens up seetings_menu within here.
	pass
	#get_tree().change_scene_to_file("insert file link to scene")

func _on_credits_b_pressed() -> void:
	pass

func _on_quit_b_pressed() -> void:
	get_tree().quit()

# play_menu buttons
func _on_story_b_pressed() -> void:
	# will show story_menu
	pass

func _on_custom_b_pressed() -> void:
	# will show custom_menu
	pass
