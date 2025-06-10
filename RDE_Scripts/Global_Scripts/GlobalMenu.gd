extends Node

signal fight_selected_pressed(fight_type : String)
signal menu_change(new_menu : String)

enum Menu {
	MAIN,
	FIGHT,
	SETTINGS,
	CREDITS
}
