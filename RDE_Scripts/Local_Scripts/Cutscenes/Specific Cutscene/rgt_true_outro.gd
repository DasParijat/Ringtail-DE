extends BaseCutscene

@onready var textbox : CTextBox = $Textbox

# Actors
@onready var oswald : Sprite2D = $ActorContainer/Oswald
@onready var ringtail : Sprite2D = $ActorContainer/Ringtail
@onready var darius : Sprite2D = $ActorContainer/Darius
@onready var obignale : Sprite2D = $ActorContainer/Obignale


@onready var title_drop : TextureRect = $ControlContainer/RDE_Title
@onready var black_overlay : ColorRect = $ControlContainer/BlackOverlay
@onready var white_overlay : ColorRect = $ControlContainer/WhiteOverlay


# Speaker names
var ringtail_name : SpeakerName = SpeakerName.new("Ringtail", Color8(181, 191, 0))
var oswald_name : SpeakerName = SpeakerName.new("Oswald", Color8(249, 208, 96))

# Sounds
@onready var ambiance_sound : AudioStreamPlayer = $AmbianceSound
@onready var ending_sound : AudioStreamPlayer2D = $EndingSound

func _ready() -> void:
	cutscene_manager_func = "cutscene_handler"
	
	ringtail.global_position = Vector2(0, -210)
	oswald.global_position = Vector2(0, 40)
	
	title_drop.hide()
	darius.hide()
	obignale.hide()
	
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
			display_text("You did good", ringtail_name)
		4:
			display_text("*cough*", ringtail_name)
		5:
			pass
		6:
			hide_textbox()
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0, -100), 0.5)
			start_tween(camera_2d, "global_position", Vector2(0, -150), 0.5)
			start_tween(camera_2d, "zoom", Vector2(1.1, 1.1), 0.5)
		7:
			show_textbox()
			display_text("You gonna shoot me or what?", ringtail_name)
		8:
			display_text("...", oswald_name)
			start_tween(camera_2d, "global_position", Vector2(0, -150), 0.5)
		9:
			display_text("...Why?", oswald_name)
		10:
			display_text("Excuse me?", ringtail_name)
		11:
			display_text("In all my time researching you", oswald_name)
		12:
			display_text("I never figured out why you do what you do", oswald_name)
		13:
			display_text("Why terrorize an innocent town?", oswald_name)
		14:
			display_text("Ha...innocent...", ringtail_name, 0.07)
		15:
			hide_textbox()
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0,-50), 0.5)
		16:
			show_textbox()
			display_text("This town is full of bullies", ringtail_name)
		17:
			display_text("Bullies?", oswald_name)
			start_tween(oswald, "global_position", Vector2(0,-30), 0.3)
		18:
			display_text("Calling her names...", ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -210), 0.4)
			start_tween(camera_2d, "zoom", Vector2(1.2, 1.2), 0.5)
		19:
			display_text("...stealing her lunch...", ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(1.3, 1.3), 0.5)
		20:
			display_text("...pushing her around...", ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.5)
		21:
			display_text("Her?", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, -30), 0.4)
			start_tween(camera_2d, "position", Vector2(0, -30), 0.5)
		22:
			display_text("...My sister", ringtail_name, 0.08)
			start_tween(camera_2d, "position", Vector2(0, -210), 0.5)
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 0.5)
		23:
			display_text("You have a sister?", oswald_name)
			start_tween(camera_2d, "position", Vector2(0, -30), 0.5)
			start_tween(camera_2d, "zoom", Vector2(1.3, 1.3), 0.5)
		24:
			display_text("Well...more complicated than that", ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -210), 0.5)
		25:
			display_text("But in essence, a sister", ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.4)
		26:
			display_text("Huh...", oswald_name)
			start_tween(camera_2d, "position", Vector2(0, -30), 0.4)
			start_tween(camera_2d, "zoom", Vector2(1.2, 1.2), 0.4)
		27:
			display_text("I don't recall seeing another raccoon like you before", oswald_name)
		28:
			display_text("Of course you haven't you idiot", ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -210), 0.3)
		29:
			display_text("That's cause she's human", ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -210), 0.5)
		30:
			display_text("...like you", ringtail_name, 0.06)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.3)
		31:
			display_text("But because of her father...", ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(1.2, 1.2), 0.3)
		32:
			display_text("...my creator...", ringtail_name, 0.06)
		33:
			display_text("...she was bullied", ringtail_name, 0.05)
		34:
			start_tween(oswald, "global_position", Vector2(0, -20), 0.5)
			display_text("It's not her fault my creator was that way", ringtail_name)
		35:
			enable_auto_skip()
			display_text("So I had to-", ringtail_name, 0.08)
		36:
			display_text("You think that justifies what you did?", oswald_name)
			start_tween(camera_2d, "position", Vector2(0, -25), 0.5)
		37:
			display_text("You think terrorizing a town is gonna help her?", oswald_name)
			start_tween(oswald, "global_position", Vector2(0, -30), 0.3)
		38:
			display_text("And what? Let them get away with it?", ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -210), 0.5)
		39:
			display_text("You folk needed to face the consequences", ringtail_name)
		40:
			display_text("Consequences for crap most of us weren't involved with?", oswald_name)
			start_tween(camera_2d, "position", Vector2(0, -30), 0.5)
		41:
			display_text("...", ringtail_name, 0.09)
			start_tween(camera_2d, "position", Vector2(0, -210), 0.5)
		42:
			display_text("I'm not gonna die this easy...", ringtail_name, 0.06)
		43:
			display_text("Excuse me?", oswald_name)
			start_tween(camera_2d, "position", Vector2(0, -30), 0.5)
		44:
			hide_textbox()
			enable_auto_skip()
			start_tween(camera_2d, "position", Vector2(0, -210), 0.4)
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 0.8)
		45:
			ringtail.flip_v = false
		46:
			show_textbox()
			display_text("...not for Evelyn", ringtail_name, 0.08)
		47:
			hide_textbox()
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0, -5), 1.0)
			start_tween(camera_2d, "position", Vector2(0, -5), 0.5)
		48:
			show_textbox()
			display_text("I'm not gonna let you tell ME", ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -200), 0.5)
			start_tween(ringtail, "global_position", Vector2(0, -200), 0.7)
		49:
			display_text("That MY family's struggles...", ringtail_name, 0.05)
			start_tween(camera_2d, "position", Vector2(0, -190), 0.4)
			start_tween(ringtail, "global_position", Vector2(0, -190), 0.3)
		50:
			display_text("And MY family's idea of justice...", ringtail_name, 0.05)
			start_tween(camera_2d, "position", Vector2(0, -180), 0.4)
			start_tween(ringtail, "global_position", Vector2(0, -180), 0.3)
		51:
			display_text("Are any less than YOURS", ringtail_name, 0.05)
			start_tween(camera_2d, "position", Vector2(0, -170), 0.4)
			start_tween(ringtail, "global_position", Vector2(0, -170), 0.3)
		52:
			hide_textbox()
			enable_auto_skip()
			start_tween(camera_2d, "position", Vector2(0, -50), 0.5)
			start_tween(oswald, "global_position", Vector2(0, -50), 1.0)
		53:
			show_textbox()
			start_tween(ringtail, "global_position", Vector2(0, -165), 0.8)
			start_tween(camera_2d, "position", Vector2(0, -165), 0.5)
			display_text("Only one of us will leave this forest", ringtail_name, 0.07)
			start_tween(camera_2d, "zoom", Vector2(1.6, 1.6), 0.8)
		54:
			enable_auto_skip()
			display_text("And that will be-", ringtail_name, 0.09)
		55:
			hide_textbox()
			enable_auto_skip()
			AudioManager.play_audio_one_shot(preload("res://RDE_Audio/Gun Audio/PumpShotgun Audio/pump_shot1.mp3"), "CScene Bus")
			white_overlay.color.a = 1
			start_tween(ringtail, "modulate", Color(1,1,1,0), 1.0)
			start_tween(camera_2d, "zoom", Vector2(1,1), 0.5)
			start_tween(camera_2d, "position", Vector2(0,0), 0.5)
			start_tween(oswald, "global_position", Vector2(0, -10), 0.5)
			ringtail.hide()
		56:
			enable_auto_skip()
			start_tween(white_overlay, "color", Color(1, 1, 1, 0), 2.0)
		57:
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0, 0), 1.0)
			start_tween(camera_2d, "position", Vector2(0,0), 0.8)
		58:
			show_textbox()
			display_text("So thats it then?", oswald_name)
		59:
			display_text("Ringtail is dead", oswald_name)
		60:
			display_text("The town is saved...", oswald_name)
		61:
			enable_auto_skip()
			hide_textbox()
			start_tween(camera_2d, "zoom", Vector2(1.7, 1.7), 1.5)
		62:
			show_textbox()
			display_text("...hopefully", oswald_name)
		63:
			hide_textbox()
			enable_auto_skip()
			start_tween(oswald, "rotation_degrees",-270, 0.8)
			start_tween(camera_2d, "zoom", Vector2(1.6, 1.6), 0.8)
		64:
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0, 500), 2.0)
			start_tween(camera_2d, "position", Vector2(0, 500), 2.5)
			start_tween(black_overlay, "color", Color(0, 0, 0, 1), 2.0)
		65:
			show_textbox()
			display_text("It's been a few weeks since I killed Ringtail", oswald_name)
		66:
			display_text("The whole town celebrated", oswald_name)
		67:
			display_text("And my brother got the whole force to do a parade", oswald_name)
		68:
			display_text("Just for me", oswald_name)
		69:
			display_text("But...", oswald_name, 0.07)
		70:
			display_text("I don't think it's truly over", oswald_name)
		71:
			display_text("His sister....Evelyn", oswald_name)
		72:
			display_text("She's still out there", oswald_name)
		73:
			display_text("And she must've known I've killed her brother by now", oswald_name)
		74:
			display_text("...", oswald_name, 0.06)
		75:
			display_text("...I saw it again, at the cafe", oswald_name, 0.06)
		76:
			display_text("The silhouette...", oswald_name, 0.07)
		77:
			display_text("Someone's stalking me", oswald_name, 0.06)
		78:
			display_text("I know it's my nephew's birthday tomorrow", oswald_name)
		79:
			display_text("But I don't think it's safe to go", oswald_name)
		80:
			display_text(".....", oswald_name, 0.07)
		81:
			display_text("I'm sorry I can't make it", oswald_name, 0.06)
		82:
			display_text("...Theodore", oswald_name, 0.07)
		83:
			show_textbox()
			textbox.offset = Vector2(0, -300)
			textbox.set_font_size(50)
			display_text("On 11/19/96, Oswald was reported missing", blank_name, 0.08)
		84:
			display_text("The suspects at large are unknown", blank_name, 0.08)
		85:
			ambiance_sound.stop()
			#ending_sound.play()
			AudioManager.play_audio_one_shot(preload("res://RDE_Audio/Music/brothers music.mp3"), "CScene Bus")
			
			hide_textbox()
			enable_auto_skip()
			camera_2d.global_position = Vector2(0, 1000)
			start_tween(black_overlay, "color", Color(0, 0, 0, 0), 3.0)
			start_tween(oswald, "global_position", Vector2(0, 750), 3.0)
			
			darius.show()
			obignale.show()
		86:
			enable_auto_skip()
			start_tween(oswald, "global_position", Vector2(0, 1500), 3.0)
		87:
			enable_auto_skip()
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.8)
			start_tween(camera_2d, "position", Vector2(0, -200), 2.0)
		88:
			enable_auto_skip()
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 4.0)
		89:
			#ambiance_sound.stop()
			enable_auto_skip()
			black_overlay.color = Color(0,0,0,1)
			title_drop.show()
			#AudioManager.play_audio_one_shot(preload("res://RDE_Audio/Music/brothers music.mp3"), "CScene Bus")
			start_tween(ringtail, "global_position", Vector2(0, 0), 3.0)
		90:
			show_textbox()
			textbox.offset = Vector2(0, 0)
			textbox.set_font_size()
			display_text("Thank you for playing Ringtail Definitive Edition", blank_name)
		91:
			if GlobalSave.all_flags_true():
				display_text("And thank you for 100% completing the game!", blank_name)
			else:
				display_text("You can unlock a new menu theme by playing 
							all difficulties, all modes, and beating Ringtail with all modes enabled", blank_name)
		92:
			if GlobalSave.all_flags_true():
				display_text("Enjoy your day!", blank_name)
			else:
				display_text("Good Luck!", blank_name)
		_:
			#ending_sound.stop()
			AudioManager.clear_one_shots()
			show_textbox()
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,0), 0.2)
			change_state(State.COMPLETE)
