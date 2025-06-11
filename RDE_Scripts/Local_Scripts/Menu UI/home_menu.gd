extends CanvasLayer
# TODO - Create a new menu
# TODO - Possibly create some sort of state machine to handle opening menus

@export var main_menu : MainMenu
@export var credits_menu : FightMenu
@export var settings_menu : FightMenu
@export var fight_menu : FightMenu

@export var background : TextureRect

var cur_menu : Control

func _ready() -> void:
	Engine.time_scale = 1 # Ensures time scale is normal when menu loads
	GlobalMenu.connect("menu_change", Callable(self, "_on_menu_change"))
	GlobalScene.cur_scene_type = GlobalScene.SceneType.MAIN_MENU
	GlobalFightStats.reset_fight_stats()
	
	set_cur_menu(main_menu)

func set_cur_menu(new_menu) -> void:
	cur_menu = new_menu
	darken_anim()
	cur_menu.enter_animation()

func _on_menu_change(new_menu) -> void:
	match(new_menu):
		"MAIN":
			set_cur_menu(main_menu)
		"SETTINGS":
			pass
		"CREDITS":
			pass
		"FIGHT":
			set_cur_menu(fight_menu)

func darken_anim() -> void:
	## The background goes dark when not on main
	var tween : Tween = create_tween()
	
	var new_modulate : Color = Color(0.4, 0.4, 0.4)
	if cur_menu == main_menu:
		new_modulate = Color(1, 1, 1)
		
	tween.tween_property(background, "modulate", new_modulate, 0.25)
