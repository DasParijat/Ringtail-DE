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
			pass
		10:
			hide_textbox()
			enable_auto_skip()
			start_tween(overlay, "modulate", Color(1,1,1,0), 0.4)
			start_tween(oswald, "global_position", Vector2(0, 720), 0.8)
			start_tween(camera_2d, "position", Vector2(0, 720), 0.8)
		11:
			show_textbox()
			display_text("That raccoon should be here any moment now", oswald_name)
		12:
			enable_auto_skip()
			start_tween(camera_2d, "position", Vector2(0, 620), 0.5)
			start_tween(oswald, "rotation_degrees", -40, 1.0)
			hide_textbox()
		13:
			enable_auto_skip()
			start_tween(oswald, "rotation_degrees", -140, 1.0)
		14:
			enable_auto_skip()
			start_tween(oswald, "rotation_degrees", -90, 1.0)
			start_tween(camera_2d, "position", Vector2(0, 720), 0.7)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.7)
		15:
			show_textbox()
			display_text("He should be here...", oswald_name, 0.04)
		16:
			enable_auto_skip()
			start_tween(camera_2d, "zoom", Vector2(1.6, 1.6), 0.3)
			display_text("Maybe I got the wrong-", oswald_name, 0.08)
		17:
			start_tween(camera_2d, "zoom", Vector2(1, 1), 0.3)
			display_text("Look who we have here", ringtail_name, 0.04)
			start_tween(ringtail, "modulate", Color(1,1,1,1), 0.2)
		18:
			hide_textbox()
			enable_auto_skip()
			start_tween(camera_2d, "position", Vector2(0, -20), 0.2)
			start_tween(ringtail, "modulate", Color(1,1,1,1), 0.9)
			start_tween(oswald, "modulate", Color(1,1,1,1), 0.5)
		19:
			show_textbox()
			start_tween(oswald, "global_position", Vector2(0, 10), 0.7)
			display_text("Anyone tell you hunting alone is dangerous?", ringtail_name)
		20:
			display_text("It's time you face your end!", oswald_name)
		21:
			display_text("Ringtail", oswald_name)
		22:
			display_text("My end?", ringtail_name)
		23:
			enable_auto_skip()
			display_text("Ha ha ha ha", ringtail_name, 0.085)
		24:
			display_text("Clearly you haven't been watching the news", ringtail_name)
		25:
			display_text("I did my research", oswald_name)
		26:
			display_text("How else could I have found you here?", oswald_name)
		27:
			hide_textbox()
			enable_auto_skip()
			start_tween(ringtail, "global_position", Vector2(0,-170), 1.2)
		28:
			display_text("Good point...", ringtail_name)
		29:
			start_tween(ringtail, "global_position", Vector2(0,-160), 0.8)
			display_text("But still, a couple of guns?", ringtail_name)
		30:
			display_text("I wiped a whole SWAT team a week ago", ringtail_name)
		31:
			display_text("What makes you think you have a chance?", ringtail_name)
		32:
			hide_textbox()
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0, 25), 2.0)
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 2.0)
			start_tween(camera_2d, "position", Vector2(0, 25), 2.0)
		33:
			display_text("Nothing", oswald_name)
		34:
			display_text("Odds are in your favor", oswald_name)
		35:
			display_text("???", ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -160), 0.5)
		36:
			display_text("But you think at this point I care?", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, 20), 0.4)
			start_tween(camera_2d, "position", Vector2(0, 20), 0.5)
		37:
			display_text("I've sat behind desks all my life", oswald_name)
			start_tween(camera_2d, "zoom", Vector2(1.2, 1.2), 0.7)
		38:
			display_text("Waiting for things to change,", oswald_name)
		39:
			display_text("And now my world is being turned upside-down...", oswald_name)
		40:
			display_text("By some stupid raccoon none the less!", oswald_name)
			start_tween(camera_2d, "zoom", Vector2(1.6, 1.6), 0.4)
		41:
			display_text("...", ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(1.0, 1.0), 0.7)
			start_tween(camera_2d, "position", Vector2(0, -20), 0.7)
		42:
			display_text("So this is personal?", ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(1.3, 1.3), 0.6)
			start_tween(camera_2d, "position", Vector2(0, -160), 0.6)
		43:
			display_text("What else could it be!?", oswald_name)
			start_tween(camera_2d, "position", Vector2(0, 20), 0.7)
		44:
			display_text("My livelihood, my town, my cop brother, ", oswald_name)
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 0.7)
		45:
			display_text("...my nephew", oswald_name, 0.08)
			start_tween(camera_2d, "zoom", Vector2(1.7, 1.7), 0.7)
		46:
			display_text("All in danger cause of YOU!", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, 13), 0.4)
			start_tween(camera_2d, "zoom", Vector2(1.0, 1.0), 0.6)
			start_tween(camera_2d, "position", Vector2(0, -20), 0.6)
		47:
			display_text("...Family",  ringtail_name, 0.06)
			start_tween(oswald, "global_position", Vector2(0, 15), 0.4)
			start_tween(ringtail, "global_position", Vector2(0, -170), 0.6)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.7)
			start_tween(camera_2d, "position", Vector2(0, -170), 0.7)
		48:
			display_text("Is that how you justify it?",  ringtail_name)
		49:
			display_text("You think going on a suicide mission is what your family needs?",  ringtail_name)
		50:
			display_text("What you know about family you trash panda!",  oswald_name)
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 0.4)
			start_tween(camera_2d, "position", Vector2(0, 15), 0.4)
		51:
			display_text("So when your little nephew sees your death reported on the news-",  ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.7)
			start_tween(ringtail, "global_position", Vector2(0, -165), 0.6)
			start_tween(camera_2d, "position", Vector2(0, -165), 0.7)
		52:
			display_text("I'd rather that then for me to see his",  oswald_name)
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 0.4)
			start_tween(camera_2d, "position", Vector2(0, 15), 0.4)
		53:
			display_text("Now are you gonna keep stalling or what?",  oswald_name)
			start_tween(camera_2d, "zoom", Vector2(1.3, 1.3), 0.5)
			start_tween(camera_2d, "position", Vector2(0, 10), 0.5)
			start_tween(oswald, "global_position", Vector2(0, 10), 0.5)
		54:
			display_text("...",  ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -165), 0.7)
		55:
			display_text("Go ahead. Use your toys against me",  ringtail_name)
		56:
			display_text("But I ain't holding back",  ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -160), 0.7)
			start_tween(ringtail, "global_position", Vector2(0, -160), 0.6)
		57:
			display_text("Me neither",  oswald_name)
			start_tween(camera_2d, "position", Vector2(0, 10), 0.6)
		58:
			display_text("Good",  ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -160), 0.7)
		59:
			display_text("Only the most painful death...",  ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -20), 0.8)
			start_tween(camera_2d, "zoom", Vector2(1, 1), 0.8)
		60:
			display_text("...for the most diehard man",  ringtail_name)
		61:
			enable_auto_skip()
			display_text("Shut up and start-", oswald_name, 0.08)
		_:
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,0), 0.2)
			change_state(State.COMPLETE)
