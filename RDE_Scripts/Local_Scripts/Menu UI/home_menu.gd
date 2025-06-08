extends CanvasLayer
# TODO - Create a new menu
# TODO - Possibly create some sort of state machine to handle opening menus

@export var main_menu : MainMenu

var cur_menu : Control

func _ready() -> void:
	Engine.time_scale = 1 # Ensures time scale is normal when menu loads
	 
	GlobalScene.cur_scene_type = GlobalScene.SceneType.MAIN_MENU
	GlobalFightStats.reset_fight_stats()
	
	cur_menu = main_menu
	cur_menu.enter_animation()
	
	
