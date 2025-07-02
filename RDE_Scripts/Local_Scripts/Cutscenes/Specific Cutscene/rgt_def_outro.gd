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
			textbox_container.hide()
			textbox_container.modulate.a = 0
			key_hint_scene.hide()
			#hide_textbox()
			enable_auto_skip()
			start_tween(ringtail, "modulate", Color(1,1,1,1), 0.1)
			start_tween(oswald, "modulate", Color(1,1,1,1), 0.1)
			start_tween(camera_2d, "global_position", Vector2(0,-85), 2)
		2:
			if GlobalSettings.visible_hints: key_hint_scene.show()
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
			display_text("Nothing, just…", ringtail_name)
		14:
			display_text("You humans...", ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(1, 1), 0.4)
		15:
			display_text("...are quite fascinating creatures.", ringtail_name)
		16:
			hide_textbox()
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0, -10), 0.4)
		17:
			show_textbox()
			display_text("Y'know in all my research,", oswald_name)
		18:
			display_text("I never figured what kind of beast you are", oswald_name)
		19:
			display_text("Well that don't matter now does it?", ringtail_name)
		20:
			display_text("You got your moment.", ringtail_name)
		21:
			display_text(" …You're right.", oswald_name)
		22:
			display_text("Who gives a damn if you're an alien or whatever", oswald_name)
		23:
			display_text("I could care less now.", oswald_name)
		24:
			hide_textbox()
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0, -70), 0.3)
		25:
			show_textbox()
			display_text("Any last words…Ringtail?", oswald_name)
		26:
			hide_textbox()
			enable_auto_skip()
			start_tween(camera_2d, "zoom", Vector2(1.2, 1.2), 1)
		27:
			show_textbox()
			display_text("Well..", ringtail_name)
		28:
			hide_textbox()
			enable_auto_skip()
			ringtail.flip_v = false
			start_tween(ringtail, "global_position", Vector2(0, -210), 0.3)
			start_tween(oswald, "global_position", Vector2(0, -50), 0.2)
		29:
			display_text("What!? How'd you-", oswald_name)
		30:
			display_text("No…", oswald_name)
		31:
			display_text("You have to be-", oswald_name)
		32:
			hide_textbox()
			enable_auto_skip()
			start_tween(ringtail, "global_position", Vector2(0, -250), 0.3)
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.5)
			start_tween(camera_2d, "zoom", Vector2(1, 1), 1)
		33:
			ringtail.global_position = Vector2(0, 500)
			show_textbox()
			display_text("You're good at keeping up Oswald", ringtail_name)
		34:
			hide_textbox()
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0, 0), 0.2)
			start_tween(camera_2d, "zoom", Vector2(1.3, 1.3), 0.5)
			start_tween(camera_2d, "global_position", Vector2(0, 0), 0.5)
		35:
			show_textbox()
			start_tween(camera_2d, "zoom", Vector2(1.1, 1.1), 0.4)
			display_text("But…", ringtail_name)
		36:
			start_tween(camera_2d, "zoom", Vector2(1, 1), 0.5)
			display_text("You really thought it would be that easy?", ringtail_name)
		37:
			display_text("No…I-...Ringtail", oswald_name)
		38:
			display_text("Shhhh", ringtail_name)
		39:
			display_text("Relax…don't try fighting now", ringtail_name)
		40:
			display_text("Ha, this…", oswald_name)
			start_tween(oswald, "global_position", Vector2(20, 0), 0.2)
		41:
			display_text("You think imma give up? Huh?", oswald_name)
			start_tween(oswald, "global_position", Vector2(-20, 0), 0.2)
		42:
			display_text("HUH!?", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, -30), 0.2)
		43:
			display_text("I ain't one to back down!", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, -20), 0.4)
		44:
			display_text("SO STEP UP AND-", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, -10), 0.3)
		45:
			enable_auto_skip()
			ringtail.global_position = Vector2(0, 500)
			ringtail.modulate = Color(1, 1, 1, 1)
			start_tween(oswald, "global_position", Vector2(0, -7), 0.3)
			start_tween(ringtail, "global_position", Vector2(0, -7), 0.3)
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 0.3)
		46:
			hide_textbox()
			enable_auto_skip()
			white_overlay.color.a = 1
			black_overlay.color.a = 1
			start_tween(white_overlay, "color", Color(1, 1, 1, 0), 1)
		47:
			show_textbox()
			display_text("Not satisfied?")
		48:
			display_text("Me neither")
		49:
			display_text("Wait for later in the year")
		50:
			display_text("And try the TRUE difficulty to find out what really went down.")
		_:
			show_textbox()
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,0), 0.2)
			change_state(State.COMPLETE)
