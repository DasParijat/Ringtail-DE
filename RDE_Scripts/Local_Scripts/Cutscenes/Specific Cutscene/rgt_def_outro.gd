extends BaseCutscene

@onready var textbox : CTextBox = $Textbox

# Actors
@onready var oswald : Sprite2D = $ActorContainer/Oswald
@onready var ringtail : Sprite2D = $ActorContainer/Ringtail

@onready var black_overlay : ColorRect = $ControlContainer/BlackOverlay
@onready var white_overlay : ColorRect = $ControlContainer/WhiteOverlay


# Speaker names
var ringtail_name : SpeakerName = SpeakerName.new("Ringtail", Color8(181, 191, 0))
var oswald_name : SpeakerName = SpeakerName.new("Oswald", Color8(249, 208, 96))

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
			
			enable_auto_skip()
			start_tween(ringtail, "modulate", Color(1,1,1,1), 0.1)
			start_tween(oswald, "modulate", Color(1,1,1,1), 0.1)
			start_tween(camera_2d, "global_position", Vector2(0,-85), 0.8)
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
			start_tween(camera_2d, "global_position", Vector2(0, -160), 0.5)
			start_tween(camera_2d, "zoom", Vector2(1.2, 1.2), 0.5)
		11:
			display_text("Ha…", ringtail_name)
		12:
			display_text("What?", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, -80), 0.3)
		13:
			display_text("Nothing, just…", ringtail_name)
		14:
			display_text("Oswald Jones?", ringtail_name)
			start_tween(camera_2d, "global_position", ringtail.global_position, 0.3)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.4)
		15:
			display_text("That's really your name?", ringtail_name)
		16:
			hide_textbox()
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0, -10), 0.4)
			start_tween(camera_2d, "global_position", Vector2(0, -80), 0.4)
			start_tween(camera_2d, "zoom", Vector2(1.2, 1.2), 0.4)
		17:
			show_textbox()
			display_text("Are you serious right now?", oswald_name)
		18:
			display_text("You're one shot away from death, and you wanna crack jokes?", oswald_name)
		19:
			start_tween(camera_2d, "global_position", ringtail.global_position, 0.4)
			display_text("What? You want me to beg for my life?", ringtail_name)
		20:
			display_text("'Oh please, Oswald, spare me the horror!'", ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 0.4)
		21:
			display_text("'I promise I will undo all my wrong doings! Please!'", ringtail_name, 0.04)
			start_tween(camera_2d, "zoom", Vector2(1.8, 1.8), 0.4)
		22:
			start_tween(camera_2d, "global_position", oswald.global_position, 0.4)
			display_text("...", oswald_name)
		23:
			start_tween(camera_2d, "global_position", ringtail.global_position, 0.4)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.4)
			display_text("Is your hero fantasy fulfilled now?", ringtail_name, 0.04)
		24:
			hide_textbox()
			enable_auto_skip()
			start_tween(camera_2d, "zoom", Vector2(1, 1), 0.5)
			start_tween(camera_2d, "global_position", Vector2(0, -90), 0.5)
			start_tween(oswald, "global_position", Vector2(0, -70), 0.5)
		25:
			show_textbox()
			display_text("...any other last words?", oswald_name)
		26:
			hide_textbox()
			enable_auto_skip()
			start_tween(camera_2d, "global_position", ringtail.global_position, 0.5)
			start_tween(camera_2d, "zoom", Vector2(1.2, 1.2), 0.5)
		27:
			show_textbox()
			display_text("Last words? Well...", ringtail_name)
		28:
			hide_textbox()
			enable_auto_skip()
			ringtail.flip_v = false
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.3)
			start_tween(camera_2d, "global_position", Vector2(0, -250), 0.3)
			start_tween(ringtail, "global_position", Vector2(0, -250), 0.3)
			start_tween(oswald, "global_position", Vector2(0, -50), 0.2)
		29:
			display_text("What!? How'd you-", oswald_name)
		30:
			start_tween(camera_2d, "global_position", Vector2(0, -80), 0.3)
			display_text("No…", oswald_name)
		31:
			display_text("You have to be-", oswald_name)
		32:
			hide_textbox()
			enable_auto_skip()
			start_tween(camera_2d, "global_position", Vector2(0, -250), 0.3)
			start_tween(ringtail, "global_position", Vector2(0, -250), 0.3)
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.5)
			await GlobalTime.local_wait(0.5)
			ringtail.global_position = Vector2(0, 500)
		33:
			show_textbox()
			start_tween(camera_2d, "global_position", Vector2(0, -50), 0.4)
			start_tween(camera_2d, "zoom", Vector2(0.8, 0.8), 0.6)
			display_text("You're good at keeping up Oswald", ringtail_name)
		34:
			hide_textbox()
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0, 0), 0.2)
			start_tween(camera_2d, "global_position", Vector2(0, 0), 0.5)
		35:
			show_textbox()
			enable_auto_skip()
			display_text("But…", ringtail_name, 0.02)
		36:
			display_text("You really thought it would be that easy?", ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(0.9, 0.9), 0.8)
		37:
			display_text("No…I-...Ringtail", oswald_name)
		38:
			display_text("Shhhh", ringtail_name, 0.05)
		39:
			display_text("Relax…don't try fighting now", ringtail_name)
		40:
			display_text("Ha, this…", oswald_name)
			start_tween(oswald, "rotation_degrees", -40, 0.2)
			start_tween(oswald, "global_position", Vector2(30, 0), 0.2)
		41:
			display_text("You think imma give up? Huh?", oswald_name)
			start_tween(oswald, "rotation_degrees", -140, 0.2)
			start_tween(oswald, "global_position", Vector2(-30, 0), 0.2)
		42:
			#enable_auto_skip()
			display_text("HUH!?", oswald_name)
			start_tween(oswald, "rotation_degrees", -90, 0.2)
			start_tween(oswald, "global_position", Vector2(0, -30), 0.2)
			start_tween(camera_2d, "zoom", Vector2(0.7, 0.7), 0.7)
		43:
			display_text("I ain't one to back down!", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, -20), 0.4)
		44:
			enable_auto_skip()
			display_text("SO STEP UP AND-", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, -10), 0.3)
			start_tween(camera_2d, "zoom", Vector2(0.9, 0.9), 0.7)
		45:
			enable_auto_skip()
			ringtail.global_position = Vector2(0, 500)
			ringtail.modulate = Color(1, 1, 1, 1)
			start_tween(oswald, "global_position", Vector2(0, -7), 0.3)
			start_tween(ringtail, "global_position", Vector2(0, -7), 0.3)
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 0.3)
		46:
			AudioManager.play_audio_one_shot(preload("res://RDE_Audio/Game Over Sounds/rde_game_over4.mp3"), "CScene Bus")
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
			display_text("Try the HARD difficulty to find out what really went down")
		_:
			show_textbox()
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,0), 0.2)
			change_state(State.COMPLETE)
