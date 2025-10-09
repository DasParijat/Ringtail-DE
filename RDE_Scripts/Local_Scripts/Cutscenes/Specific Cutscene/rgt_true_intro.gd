extends BaseCutscene

@onready var textbox : CTextBox = $Textbox

# Actors
@onready var oswald : Sprite2D = $ActorContainer/Oswald
@onready var ringtail : Sprite2D = $ActorContainer/Ringtail
@onready var overlay : ColorRect = $ControlContainer/Overlay

# Speaker names
var ringtail_name : SpeakerName = SpeakerName.new("Ringtail", Color8(181, 191, 0))
var oswald_name : SpeakerName = SpeakerName.new("Oswald", Color8(249, 208, 96))
var tommy_name : SpeakerName = SpeakerName.new("Tommy", Color8(96, 249, 208))

func _ready() -> void:
	cutscene_manager_func = "cutscene_handler"
	
	ringtail.global_position = Vector2(0, -160)
	oswald.global_position = Vector2(0, 1400)
	camera_2d.global_position = Vector2(0, 1000)
	
	_base_ready()

func cutscene_handler() -> void:
	match c_index:
		0:
			display_text("Press ESC to access pause menu. Press T to skip cutscene")
		1:
			start_tween(oswald, "modulate", Color(1,1,1,1), 0.2)
			textbox.offset = Vector2(0, -300)
			textbox.set_font_size(50)
			display_text("October 1996, Plankwood USA", blank_name, 0.09)
		2:
			textbox.offset = Vector2(0, 0)
			textbox.set_font_size()
			display_text("That damn raccoon has been terrorizing us for months", oswald_name)
		3:
			display_text("I’m tired of sitting around and watching him suck the life out this town", oswald_name)
		4:
			display_text("In both senses...", oswald_name, 0.04)
		5:
			display_text("…", oswald_name)
		6:
			display_text("All this research, training, and what not,", oswald_name)
		7:
			display_text("I just hope it's enough to stop him.", oswald_name)
		8:
			pass
		9:
			hide_textbox()
			enable_auto_skip()
			start_tween(overlay, "modulate", Color(1,1,1,0), 0.4)
			start_tween(oswald, "global_position", Vector2(0, 720), 0.8)
			start_tween(camera_2d, "position", Vector2(0, 720), 0.8)
		10:
			show_textbox()
			display_text("That raccoon should be here any moment now", oswald_name)
		11:
			start_tween(camera_2d, "zoom", Vector2(1.7, 1.7), 0.4)
			display_text("*phone ringing*", blank_name)
		12:
			display_text("What? Now of all times!?", oswald_name)
		13:
			display_text("*phone still ringing*", blank_name)
		14:
			display_text("Tommy, I thought I made myself clear", oswald_name)
		15:
			display_text("stupid fool", tommy_name)
			start_tween(camera_2d, "position", Vector2(100, 720), 0.2)
		16:
			display_text("stupid wefwffool", oswald_name)
			start_tween(camera_2d, "position", Vector2(0, 720), 0.2)
		_:
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,0), 0.2)
			change_state(State.COMPLETE)
