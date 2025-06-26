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
	
	ringtail.global_position = Vector2(0, -200)
	oswald.global_position = Vector2(0, 1400)
	camera_2d.global_position = Vector2(0, 1000)
	
	_base_ready()

func cutscene_handler() -> void:
	match c_index:
		0:
			display_text("Press ESC to access pause menu. Press T to skip cutscene")
		1:
			start_tween(oswald, "modulate", Color(1,1,1,1), 0.2)
			display_text("", date_name)
		2:
			display_text("That damn raccoon has been terrorizing us for months", oswald_name)
		3:
			display_text("People are moving out, stores shutting down, 
						and the cops have barely made a dent", oswald_name)
		4:
			display_text("But I refuse to cower to it", oswald_name, 0.03)
		5:
			display_text("I studied it, I trained for it, and now…", oswald_name)
		6:
			display_text("…now it’s time to stop this nefarious beast!", oswald_name)
		7:
			hide_textbox()
			enable_auto_skip()
			start_tween(overlay, "modulate", Color(1,1,1,0), 0.4)
			start_tween(oswald, "global_position", Vector2(0, 800), 0.8)
		8:
			show_textbox()
			start_tween(oswald, "global_position", Vector2(0, 750), 0.2)
			start_tween(camera_2d, "position", Vector2(0, 750), 0.2)
			display_text("That raccoon should be here any moment now", oswald_name)
		9:
			start_tween(oswald, "global_position", Vector2(0, 730), 0.4)
			start_tween(camera_2d, "position", Vector2(0, 730), 0.4)
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 0.4)
			display_text("*phone ringing*", blank_name)
		10:
			display_text("What? He’s seriously calling me NOW!?", oswald_name)
		11:
			display_text("...No", oswald_name, 0.05)
		12:
			display_text("... I’ve made my decision already", oswald_name, 0.03)
		13:
			display_text("*Hangs up phone*", oswald_name)
		14:
			start_tween(camera_2d, "zoom", Vector2(1, 1), 0.3)
			display_text("Look who we have here", ringtail_name, 0.03)
			start_tween(ringtail, "modulate", Color(1,1,1,1), 0.2)
		15:
			hide_textbox()
			enable_auto_skip()
			start_tween(camera_2d, "position", Vector2(0, 0), 0.3)
			start_tween(ringtail, "modulate", Color(1,1,1,1), 0.9)
			start_tween(oswald, "modulate", Color(1,1,1,1), 0.5)
		16:
			show_textbox()
			start_tween(oswald, "global_position", Vector2(0, 20), 0.5)
			display_text("It's over! No more games now!", oswald_name)
		17:
			display_text("I’m ending you here once and for all!", oswald_name)
		18:
			pass
		19:
			pass
		20:
			pass
		_:
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,0), 0.2)
			change_state(State.COMPLETE)
