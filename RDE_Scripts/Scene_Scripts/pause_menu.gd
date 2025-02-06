extends CanvasLayer

@onready var main = $".."

func unpause() -> void:
	# Need to unpause so the Engine time scale isn't 0 when going to menu
	GlobalSignal.quit_game.emit()
	main.pause_game() 
	
func _on_resume_b_pressed() -> void:
	main.pause_game()

func _on_settings_b_pressed() -> void:
	pass # Replace with function body.
	#get_tree().change_scene_to_file("insert file link to scene")

func _on_quit_b_pressed() -> void:
	unpause() 
	GlobalScene.load_next_scene("res://RDE_Scenes/main_menu.tscn")


func _on_reset_b_pressed() -> void:
	# temp button for debugging
	unpause()
	GlobalScene.load_next_scene("res://RDE_Scenes/game.tscn")
