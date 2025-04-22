extends CanvasLayer

@onready var main = $".."
@onready var panel_container: PanelContainer = $PanelContainer

var tween : Tween = Tween.new()

func slide_menu_out() -> void:
	tween = create_tween()
	tween.set_parallel(true) 
	print("slide menu")
	
	tween.tween_property(panel_container, "position:x", -400, 0.5).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(panel_container, "modulate", Color(1, 1, 1, 0), 0.5)

	#await tween.finished
	
func unpause() -> void:
	# Need to unpause so the Engine time scale isn't 0 when going to menu
	#await slide_menu_out()
	slide_menu_out()
	GlobalSignal.quit_game.emit()
	main.pause_game() 
	
func _on_resume_b_pressed() -> void:
	main.pause_game()

func _on_settings_b_pressed() -> void:
	pass # Replace with function body.
	#GlobalScene.load_next_scene(GlobalScene.SETTINGS)

func _on_quit_b_pressed() -> void:
	unpause()
	#GlobalScene.emit_signal("quit_to_menu")
	GlobalScene.load_next_scene(GlobalScene.MAIN_MENU)


func _on_reset_b_pressed() -> void:
	# temp button for debugging
	unpause()
	GlobalScene.load_next_scene(GlobalScene.GAME)
