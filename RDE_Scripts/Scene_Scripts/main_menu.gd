extends Control
# Code handling the whole main menu, including it's submenus
# Settings Menu is excluded, handled by it's own script

@onready var front_menu : Control = $front_menu
@onready var play_menu : Container = $play_menu
@onready var story_menu : Control = $story_menu

@onready var bg_anim_player : AnimationPlayer = $front_menu/Background/AnimationPlayer

func _ready() -> void:
	Engine.time_scale = 1 # Ensures time scale is normal when menu loads
	 
	GlobalScene.cur_scene_type = GlobalScene.SceneType.MAIN_MENU
	GlobalFightStats.reset_fight_stats()
	
	front_menu.size = DisplayServer.window_get_size() / 3
	# TODO set size of other menus when I get to them
	
# front_menu buttons
func _on_play_b_pressed() -> void:
	# TODO Fix issue of Play button not working after quiting game 
	# will open up play_menu
	var tween = create_tween()
	tween.set_parallel(true)
	
	bg_anim_player.play("leave_main_menu")
	tween.tween_property(front_menu, "position", Vector2(0, -720), 0.3)
	tween.tween_property(story_menu, "position", Vector2(0, 0), 0.3)
	
func _on_settings_b_pressed() -> void:
	# will show settings_menu (seperate scene)
	# ideally, opens up seetings_menu within here.
	pass
	#GlobalScene.load_next_scene(GlobalScene.SETTINGS)

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

# Story Menu Buttons
func _on_sm_exit_b_pressed() -> void:
	var tween = create_tween()
	tween.set_parallel(true)
	
	bg_anim_player.play("return_main_menu")
	tween.tween_property(story_menu, "position", Vector2(0,720), 0.3)
	tween.tween_property(front_menu, "position", Vector2(0, 0), 0.3)
