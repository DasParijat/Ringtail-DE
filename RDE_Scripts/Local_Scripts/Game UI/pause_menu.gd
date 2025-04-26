extends CanvasLayer

@onready var game = $".."
@onready var panel_container: PanelContainer = $PanelContainer

var tween : Tween = Tween.new()

func _ready() -> void:
	## Set properties to hidden
	set_def_prop()
	$".".hide()

func set_def_prop(x_pos : float = -400, alpha = 0) -> void:
	## How pause menu should be normally (when unpaused)
	## Given param values are the true default
	panel_container.position.x = x_pos
	panel_container.modulate = Color(1,1,1, alpha)
	
func slide_menu(x_pos : float, modulate : float, rate : float = 0.1) -> void:
	tween = create_tween()
	tween.set_parallel(true) 
	tween.set_speed_scale(1.0)# / Engine.time_scale)
	
	tween.tween_property(panel_container, "position:x", x_pos, rate).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(panel_container, "modulate", Color(1, 1, 1, modulate), rate)
		
	await tween.finished
	
func _leave_pause_state() -> void:
	# Need to unpause so the Engine time scale isn't 0 when going to menu / resetting game
	GlobalSignal.quit_game.emit()
	game.pause_game() 
	
func _on_resume_b_pressed() -> void:
	#await slide_menu_out(-400, 0)
	game.pause_game()

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
	$".".show()
	await slide_menu(0, 1, 0.1)
	set_def_prop(0, 1)

func _on_game_unpause() -> void:
	await slide_menu(-400, 0, 0.3)
	$".".hide()
	set_def_prop()
