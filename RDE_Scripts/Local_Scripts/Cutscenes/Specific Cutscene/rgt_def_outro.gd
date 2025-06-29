extends BaseCutscene

@onready var textbox : Textbox = $Textbox

# Actors
@onready var oswald : Sprite2D = $ActorContainer/Oswald
@onready var ringtail : Sprite2D = $ActorContainer/Ringtail

@onready var black_overlay : ColorRect = $ControlContainer/BlackOverlay
@onready var white_overlay : ColorRect = $ControlContainer/WhiteOverlay


# Speaker names
var ringtail_name : SpeakerName = SpeakerName.new("Ringtail", Color.YELLOW_GREEN)
var oswald_name : SpeakerName = SpeakerName.new("Oswald", Color.YELLOW)

func _ready() -> void:
	cutscene_manager_func = "cutscene_handler"
	
	ringtail.global_position = Vector2(0, -210)
	oswald.global_position = Vector2(0, 40)
	camera_2d.global_position = Vector2(0, -70)
	
	_base_ready()

func cutscene_handler() -> void:
	match c_index:
		1:
			hide_textbox()
			enable_auto_skip()
			start_tween(ringtail, "modulate", Color(1,1,1,1), 0.1)
			start_tween(oswald, "modulate", Color(1,1,1,1), 0.1)
			start_tween(camera_2d, "global_position", Vector2(0,-85), 2)
		2:
			show_textbox()
			display_text("*breathing heavily*", oswald_name)
		3:
			display_text("*cough* It seems I underestimated you.", ringtail_name)
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass
		16:
			pass
		17:
			pass
		18:
			pass
		19:
			pass
		20:
			pass
		21:
			pass
		22:
			pass
		23:
			pass
		24:
			pass
		25:
			pass
		26:
			pass
		27:
			pass
		28:
			pass
		29:
			pass
		30:
			pass
		_:
			show_textbox()
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,0), 0.2)
			change_state(State.COMPLETE)
