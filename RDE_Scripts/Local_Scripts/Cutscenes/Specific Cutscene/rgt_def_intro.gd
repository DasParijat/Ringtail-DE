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
	camera_2d.global_position = Vector2(0, 1000)
	
	_base_ready()

func cutscene_handler() -> void:
	match c_index:
		0:
			display_text("Press ESC to access pause menu. Press T to skip cutscene")
		1:
			start_tween(ringtail, "modulate", Color(1,1,1,1), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,1), 0.2)
			display_text("", date_name)
		2:
			display_text("That damn raccoon has been terrorizing us for months", oswald_name)
		3:
			display_text("People are moving out, stores shutting down, 
						and the cops have barely made a dent", oswald_name)
		4:
			display_text("But I refuse to cower to it", oswald_name, 0.3)
		5:
			display_text("I studied it, I trained for it, and now…", oswald_name)
		6:
			display_text("…now it’s time to stop this nefarious beast!", oswald_name)
		7:
			hide_textbox()
			start_tween(overlay, "modulate", Color(1,1,1,0), 0.4)
		8:
			show_textbox()
			display_text("yello4yadadasdadasdello4yello4yello4yello4yello4", blank_name)
		_:
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,0), 0.2)
			change_state(State.COMPLETE)
