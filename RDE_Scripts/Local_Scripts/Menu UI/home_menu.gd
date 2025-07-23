extends CanvasLayer

@export var main_menu : MainMenu
@export var credits_menu : CreditsMenu
@export var settings_menu : SettingsMenu
@export var fight_menu : FightMenu

@export var background : TextureRect
@export var scene_transition : SceneTransitionFade

@onready var menu_theme_player : AudioStreamPlayer = $MenuThemePlayer

var cur_menu : Control

func _ready() -> void:
	Engine.time_scale = 1 # Ensures time scale is normal when menu loads
	
	GlobalMenu.connect("menu_change", Callable(self, "_on_menu_change"))
	GlobalScene.cur_scene_type = GlobalScene.SceneType.HOME_MENU
	GlobalFightStats.reset_fight_stats()
	
	var tween : Tween = create_tween().set_ease(Tween.EASE_OUT)
	tween.tween_property(menu_theme_player, "volume_db", -10, 0.7)
	
	set_cur_menu(main_menu)
	scene_transition.enter_anim(0.25)

func set_cur_menu(new_menu) -> void:
	cur_menu = new_menu
	#print(cur_menu)
	darken_anim()
	cur_menu.enter_animation()

func _on_menu_change(new_menu) -> void:
	match(new_menu):
		"MAIN":
			set_cur_menu(main_menu)
		"SETTINGS":
			set_cur_menu(settings_menu)
		"CREDITS":
			set_cur_menu(credits_menu)
		"FIGHT":
			set_cur_menu(fight_menu)

func darken_anim() -> void:
	## The background goes dark when not on main
	var tween : Tween = create_tween()
	
	var new_modulate : Color = Color(0.4, 0.4, 0.4)
	if cur_menu == main_menu:
		new_modulate = Color(1, 1, 1)
		
	tween.tween_property(background, "modulate", new_modulate, 0.25)
