extends BaseCutscene

# Actors
@onready var oswald : Sprite2D = $ActorContainer/Oswald
@onready var ringtail : Sprite2D = $ActorContainer/Ringtail
@onready var overlay : ColorRect = $ControlContainer/Overlay

# Speaker names
var ringtail_name : SpeakerName = SpeakerName.new("Ringtail", Color.YELLOW_GREEN)
var oswald_name : SpeakerName = SpeakerName.new("Oswald", Color.YELLOW)
var date_name : SpeakerName = SpeakerName.new("September 1996", Color.WHITE_SMOKE)

func _ready() -> void:
	cutscene_manager_func = "cutscene_handler"
	
	ringtail.global_position = Vector2(0, 10)
	oswald.global_position = Vector2(0, 50)
	camera_2d.global_position = Vector2(0, -5)
	
	_base_ready()

func cutscene_handler() -> void:
	match c_index:
		1:
			start_tween(ringtail, "modulate", Color(1,1,1,1), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,1), 0.2)
			display_text("", date_name)
		2:
			display_text("yesssllo2", oswald_name)
			start_tween(overlay, "modulate", Color(1,1,1,0), 0.4)
			hide_textbox()
		3:
			show_textbox()
			display_text("yelsadslo3", ringtail_name)
			#start_tween(ringtail, "global_position", Vector2(640, 100), 1)
			start_tween(camera_2d, "global_position", Vector2(0, 100), 1)
		4:
			display_text("yello4yadadasdadasdello4yello4yello4yello4yello4", blank_name)
		_:
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,0), 0.2)
			change_state(State.COMPLETE)
