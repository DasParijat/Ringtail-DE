extends CanvasLayer

@export var background : Control

@export var heading_text : Label 
@export var button_container : Container
@export var transition_fade : Control

@export var scene_transition_fade : SceneTransitionFade

var init_ui_y_diff : float = 50

func _ready() -> void:
	scene_transition_fade.set_enter_state()
	
	heading_text.position.y -= init_ui_y_diff
	button_container.position.y += init_ui_y_diff
	
	var tween : Tween = create_tween().set_ease(Tween.EASE_IN)
	tween.set_parallel(true)
	
	tween.tween_property(heading_text, "position:y", heading_text.position.y + init_ui_y_diff, 0.3)
	tween.tween_property(button_container, "position:y", button_container.position.y - init_ui_y_diff, 0.3)
	
	tween.tween_property(transition_fade, "modulate:a", 0, 0.4)
	
	await tween.finished
	transition_fade.hide()
	
func _on_retry_pressed() -> void:
	await scene_transition_fade.exit_anim()
	GlobalScene.load_next_scene(GlobalScene.GAME)

func _on_quit_pressed() -> void:
	await scene_transition_fade.exit_anim()
	GlobalScene.load_next_scene(GlobalScene.HOME_MENU)
