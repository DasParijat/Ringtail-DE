extends BaseCutscene

@onready var textbox : Textbox = $Textbox

# Actors
@onready var oswald : Sprite2D = $ActorContainer/Oswald
@onready var ringtail : Sprite2D = $ActorContainer/Ringtail
@onready var overlay : ColorRect = $ControlContainer/Overlay

# Speaker names
var ringtail_name : SpeakerName = SpeakerName.new("Ringtail", Color.YELLOW_GREEN)
var oswald_name : SpeakerName = SpeakerName.new("Oswald", Color.YELLOW)

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
			display_text("September 1996, Plankwood USA", blank_name, 0.09)
		2:
			textbox.offset = Vector2(0, 0)
			textbox.set_font_size()
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
			start_tween(oswald, "global_position", Vector2(0, 720), 0.8)
			start_tween(camera_2d, "position", Vector2(0, 720), 0.8)
		8:
			show_textbox()
			display_text("That raccoon should be here any moment now", oswald_name)
		9:
			start_tween(camera_2d, "zoom", Vector2(1.7, 1.7), 0.4)
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
			start_tween(oswald, "global_position", Vector2(0, 10), 0.7)
			display_text("It's over! No more games now!", oswald_name)
		17:
			display_text("I’m ending you here once and for all!", oswald_name)
		18:
			display_text("You alone!?", ringtail_name)
		19:
			display_text("I’ve put far stronger men 6 feet under", ringtail_name)
		20:
			display_text("And you’ll be joining them soon", oswald_name)
		21:
			display_text("Do you even know what you’re doing fool?", ringtail_name)
		22:
			display_text("(Do I?)", oswald_name)
		23:
			hide_textbox()
			start_tween(overlay, "modulate", Color(1,1,1,0.5), 0.2)
			# insert tutorial 1
			# Have tutorial actors fade appear and dissapear tweens
		24:
			# insert tutorial 2
			pass
		25:
			# insert tutorial 3
			pass
		26:
			start_tween(overlay, "modulate", Color(1,1,1,0), 0.2)
			show_textbox()
			display_text("Yeah I’ve done my homework on you", oswald_name)
		27:
			hide_textbox()
			enable_auto_skip()
			start_tween(ringtail, "global_position", Vector2(0, -200), 0.3)
		28:
			show_textbox()
			display_text("Very well then", ringtail_name)
		29:
			display_text("If you wanna die here, who am I to decline?", ringtail_name)
		30:
			start_tween(oswald, "global_position", Vector2(0, 20), 0.4)
			display_text("You’re the one dying here…", oswald_name)
		31:
			display_text("…Ringtail", oswald_name, 0.07)
		_:
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,0), 0.2)
			change_state(State.COMPLETE)
