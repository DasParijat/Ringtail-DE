class_name MainMenu
extends Control

@onready var title : TextureRect = $Title
@onready var button_container : Container = $HBoxContainer

@export var scene_transition : SceneTransitionFade

var anim_rate : float = 0.15
var unopened_dist_away : float = 100

var title_start_pos : Vector2
var bcontain_start_pos : Vector2

func _ready() -> void:
	# Save the intended positions of title and bcontainer
	title_start_pos = title.position
	bcontain_start_pos = button_container.position
	
	if GlobalSettings.PLATFORM == GlobalSettings.VersionType.WEB:
		$HBoxContainer/quitB.hide()
		$HBoxContainer/reloadB.show()
		
	# Set qualitative properties to that of when it's closed
	hide()
	modulate.a = 0
	title.position.y -= unopened_dist_away
	button_container.position.y += unopened_dist_away
	
func enter_animation() -> void:
	show()
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(self, "modulate:a", 1, anim_rate)
	tween.tween_property(title, "position", title_start_pos, anim_rate)
	tween.tween_property(button_container, "position", bcontain_start_pos, anim_rate)

func exit_animation() -> void:
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(self, "modulate:a", 0, anim_rate)
	tween.tween_property(title, "position:y", title_start_pos.y - unopened_dist_away, anim_rate)
	tween.tween_property(button_container, "position:y", bcontain_start_pos.y + unopened_dist_away, anim_rate)
		
	await tween.finished
	hide()
	

func _on_play_b_pressed() -> void:
	## Close main menu, opens fight menu
	GlobalMenu.emit_signal("menu_change", "FIGHT")
	await exit_animation()


func _on_settings_b_pressed() -> void:
	## Close mani menu, opens settings
	GlobalMenu.emit_signal("menu_change", "SETTINGS")
	await exit_animation()


func _on_credits_b_pressed() -> void:
	## Close main menu, opens credits
	GlobalMenu.emit_signal("menu_change", "CREDITS")
	await exit_animation()


func _on_quit_b_pressed() -> void:
	## Quits game entirely
	await exit_animation()
	get_tree().quit()

func _on_reload_b_pressed() -> void:
	## Reloads home menu itself (for debugging only)
	await exit_animation()
	await scene_transition.exit_anim()
	GlobalScene.load_next_scene(GlobalScene.HOME_MENU)
