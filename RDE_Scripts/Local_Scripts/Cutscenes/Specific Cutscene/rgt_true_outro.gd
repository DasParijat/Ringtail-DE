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
			display_text("...dressing up as her for Halloween...", ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.5)
		21:
			display_text("Her?", oswald_name)
			start_tween(oswald, "gloabl_position", Vector2(0, -30), 0.4)
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
			display_text("Of course you haven't you dumb fool", ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -210), 0.3)
		29:
			display_text("That's cause she's human", ringtail_name)
			start_tween(camera_2d, "position", Vector2(0, -210), 0.5)
		30:
			display_text("...like you", ringtail_name, 0.06)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.3)
		31:
			display_text("But because of her father,", ringtail_name)
			start_tween(camera_2d, "zoom", Vector2(1.2, 1.2), 0.3)
		32:
			display_text("...my creator...", ringtail_name, 0.06)
		33:
			display_text("She got an undeserving bad reputation among you town folk", ringtail_name, 0.06)
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
