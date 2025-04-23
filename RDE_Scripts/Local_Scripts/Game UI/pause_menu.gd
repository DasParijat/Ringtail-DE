extends CanvasLayer

@onready var main = $".."
@onready var panel_container: PanelContainer = $PanelContainer

var tween : Tween = Tween.new()

func slide_menu_out(x_pos : float, modulate : float, rate : float = 0.1) -> void:
	tween = create_tween()
	tween.set_parallel(true) 
	
	tween.tween_property(panel_container, "position:x", x_pos, rate).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(panel_container, "modulate", Color(1, 1, 1, modulate), rate)
	

func _leave_pause_state() -> void:
	# Need to unpause so the Engine time scale isn't 0 when going to menu / resetting game
	GlobalSignal.quit_game.emit()
	main.pause_game() 
	
func _on_resume_b_pressed() -> void:
	#await slide_menu_out(-400, 0)
	main.pause_game()

func _on_settings_b_pressed() -> void:
	pass # Replace with function body.
	#GlobalScene.load_next_scene(GlobalScene.SETTINGS)

func _on_quit_b_pressed() -> void:
	_leave_pause_state()
	#GlobalScene.emit_signal("quit_to_menu")
	GlobalScene.load_next_scene(GlobalScene.MAIN_MENU)

func _on_reset_b_pressed() -> void:
	# temp button for debugging
	_leave_pause_state()
	GlobalScene.load_next_scene(GlobalScene.GAME)

func _on_game_pause() -> void:
	slide_menu_out(0, 1, 0.1)

func _on_game_unpause() -> void:
	slide_menu_out(-400, 0, 0.3)
