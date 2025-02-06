extends CanvasLayer

@onready var main = $".."

func _on_resume_b_pressed() -> void:
	main.pause_game()

func _on_settings_b_pressed() -> void:
	pass # Replace with function body.
	#get_tree().change_scene_to_file("insert file link to scene")

func _on_quit_b_pressed() -> void:
	GlobalSignal.quit_game.emit()	
	main.pause_game() 
	# Need to unpause so the Engine time scale isn't 0 when going to menu
	get_tree().change_scene_to_file("res://RDE_Scenes/main_menu.tscn")
