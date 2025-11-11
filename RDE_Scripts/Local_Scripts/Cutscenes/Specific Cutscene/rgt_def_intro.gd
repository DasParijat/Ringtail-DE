extends BaseCutscene

@onready var textbox : CTextBox = $Textbox

# Actors
@onready var oswald : Sprite2D = $ActorContainer/Oswald
@onready var ringtail : Sprite2D = $ActorContainer/Ringtail
@onready var overlay : ColorRect = $ControlContainer/Overlay

# Tutorial Pop Ups
@onready var hp_1_tutorial : TutorialPopUp = $ControlContainer/HP1Tutorial
@onready var hp_2_tutorial : TutorialPopUp = $ControlContainer/HP2Tutorial
@onready var power_tutorial : TutorialPopUp = $ControlContainer/PowerTutorial
@onready var minitail_tutorial : TutorialPopUp = $ControlContainer/MinitailTutorial
@onready var low_hp_tutorial : TutorialPopUp = $ControlContainer/LowHPTutorial
@onready var gun_tutorial : TutorialPopUp = $ControlContainer/GunTutorial

# Speaker names
var ringtail_name : SpeakerName = SpeakerName.new("Ringtail", Color8(181, 191, 0))
var oswald_name : SpeakerName = SpeakerName.new("Oswald", Color8(249, 208, 96))

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
			display_text("People are moving out, stores shutting down, 
						and the cops have barely made a dent", oswald_name)
		4:
			display_text("But I refuse to cower to it", oswald_name, 0.04)
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
			enable_auto_skip()
			start_tween(camera_2d, "position", Vector2(50, 920), 0.9)
			hide_textbox()
		10:
			enable_auto_skip()
			start_tween(camera_2d, "position", Vector2(-50, 520), 0.9)
		11:
			enable_auto_skip()
			start_tween(camera_2d, "position", Vector2(0, 520), 0.7)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.7)
		12:
			show_textbox()
			display_text("It's getting cold...", oswald_name, 0.04)
		13:
			enable_auto_skip()
			start_tween(camera_2d, "zoom", Vector2(1.6, 1.6), 0.3)
			display_text("Maybe I should come back another-", oswald_name, 0.06)
		14:
			start_tween(camera_2d, "zoom", Vector2(1, 1), 0.3)
			display_text("Look who we have here", ringtail_name, 0.04)
			start_tween(ringtail, "modulate", Color(1,1,1,1), 0.2)
		15:
			hide_textbox()
			enable_auto_skip()
			start_tween(camera_2d, "position", Vector2(0, -20), 0.2)
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
			
			next_tutorial_pop_up(null, power_tutorial)
		24:
			next_tutorial_pop_up(power_tutorial, minitail_tutorial)
		25:
			next_tutorial_pop_up(minitail_tutorial, hp_1_tutorial)
		26:
			next_tutorial_pop_up(hp_1_tutorial, hp_2_tutorial)
		27:
			next_tutorial_pop_up(hp_2_tutorial, low_hp_tutorial)
		28:
			next_tutorial_pop_up(low_hp_tutorial, gun_tutorial)
		29:
			next_tutorial_pop_up(gun_tutorial)
			
			start_tween(overlay, "modulate", Color(1,1,1,0), 0.2)
			show_textbox()
			display_text("Yeah I’ve done my homework on you", oswald_name)
		30:
			hide_textbox()
			enable_auto_skip()
			start_tween(ringtail, "global_position", Vector2(0, -200), 0.2)
			start_tween(camera_2d, "position", Vector2(0, -150), 0.3)
			start_tween(camera_2d, "zoom", Vector2(1.4, 1.4), 0.3)
		31:
			show_textbox()
			display_text("Very well then", ringtail_name)
		32:
			display_text("If you wanna die here, who am I to decline?", ringtail_name)
		33:
			start_tween(oswald, "global_position", Vector2(0, 20), 0.4)
			start_tween(camera_2d, "position", Vector2(0, 20), 0.4)
			start_tween(camera_2d, "zoom", Vector2(1.5, 1.5), 0.5)
			display_text("You’re the one dying here…", oswald_name)
		34:
			display_text("…Ringtail", oswald_name, 0.07)
			start_tween(camera_2d, "zoom", Vector2(1, 1), 0.5)
		_:
			start_tween(ringtail, "modulate", Color(1,1,1,0), 0.2)
			start_tween(oswald, "modulate", Color(1,1,1,0), 0.2)
			change_state(State.COMPLETE)

func next_tutorial_pop_up(prev : TutorialPopUp = null, next : TutorialPopUp = null) -> void:
	if prev != null: prev.hide_tutorial()
	
	if next == null: return
	
	next.modulate.a = 0
	next.show()
	start_tween(next, "modulate", Color(1,1,1,1), 0.2)
