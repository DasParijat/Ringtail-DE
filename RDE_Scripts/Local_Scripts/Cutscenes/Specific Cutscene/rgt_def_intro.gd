extends BaseCutscene

# Actors
@onready var oswald: Sprite2D = $CutsceneContainer/Oswald
@onready var ringtail: Sprite2D = $CutsceneContainer/Ringtail

func _ready() -> void:
	cutscene_manager_func = "cutscene_handler"
	_base_ready()

func cutscene_handler() -> void:
	match c_index:
		1:
			display_text("yel3ecececlo1")
		2:
			display_text("yesssllo2", oswald_name)
			hide_textbox()
		3:
			show_textbox()
			display_text("yelsadslo3", ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, 100), 1)
		4:
			display_text("yello4yadadasdadasdello4yello4yello4yello4yello4", blank_name)
		_:
			change_state(State.COMPLETE)
