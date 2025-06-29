extends BaseCutscene

@onready var textbox : TextBox = $Textbox

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
			display_text("*cough* It seems I underestimated you", ringtail_name)
		4:
			display_text("*cough*", ringtail_name)
		5:
			display_text("That’s right", oswald_name)
		6:
			display_text("All that training, and now…", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, -100), 0.5)
			start_tween(camera_2d, "global_position", Vector2(0, -150), 0.5)
			start_tween(camera_2d, "zoom", Vector2(1.1, 1.1), 0.5)
		7:
			display_text("…now it’s over", oswald_name)
		8:
			display_text("I, Oswald Jones, have brought justice to Plankwood!", oswald_name)
		9:
			display_text("Maybe even the world!", oswald_name)
		10:
			hide_textbox()
			enable_auto_skip()
			start_tween(camera_2d, "global_position", Vector2(0, -160), 1)
			start_tween(camera_2d, "zoom", Vector2(1.2, 1.2), 1)
		11:
			display_text("Ha…", ringtail_name)
		12:
			display_text("What?", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, -80), 0.3)
		13:
			display_text("*cough* It seems I underestimated you.", ringtail_name)
		14:
			display_text("*cough* It seems I underestimated you.", ringtail_name)
		15:
			display_text("*cough* It seems I underestimated you.", ringtail_name)
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
