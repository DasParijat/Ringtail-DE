extends BaseCutscene

func _ready() -> void:
	cutscene_manager_func = "cutscene_handler"

func cutscene_handler() -> void:
	match c_index:
		1:
			display_text("yel3ecececlo1")
		2:
			display_text("yesssllo2", oswald_name)
		3:
			display_text("yelsadslo3", ringtail_name)
		4:
			display_text("yello4yadadasdadasdello4yello4yello4yello4yello4", blank_name)
		_:
			change_state(State.COMPLETE)
