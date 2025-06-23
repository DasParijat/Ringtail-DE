extends BaseCutscene

# Actors
@onready var oswald: Sprite2D = $Oswald
@onready var ringtail: Sprite2D = $Ringtail

func _ready() -> void:
	cutscene_manager_func = "cutscene_handler"
	#enter_animation()

func cutscene_handler() -> void:
	match c_index:
		1:
			display_text("yel3ecececlo1")
		2:
			display_text("yesssllo2", oswald_name)
		3:
			display_text("yelsadslo3", ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, 100), 1)
		4:
			display_text("yello4yadadasdadasdello4yello4yello4yello4yello4", blank_name)
		_:
			change_state(State.COMPLETE)
