extends Control

@onready var FightDescText : Label = $FightDesc/Text
@onready var fight_buttons : Node = $CenterContainer/FightButtonHolder

var selected_fight : String = "" # Get info on what fight the player is looking at from the fight buttons
var fight_res_path : String = ""

var new_selected_fight : LevelRes
var loaded_selected_fight : LevelRes

var loaded_fights : Dictionary = {}  

func _ready() -> void:
	GlobalMenu.connect("fight_selected_pressed", Callable(self, "_on_fight_selected_pressed"))
	load_all_fight_resources()

func load_all_fight_resources() -> void:
	loaded_fights.clear()
	
	for button in fight_buttons.get_children():
		if button.has_method("get_fight_type") and not button.is_locked:
			var fight_type = button.fight_type
			var res_path = "res://RDE_Resources/Level Res/" + fight_type + ".tres"
			loaded_fights[fight_type] = load(res_path)
			
	#print("loaded fights: ", loaded_fights.keys())

func _on_fight_selected_pressed(fight_type) -> void:
	if fight_type in loaded_fights:
		new_selected_fight = loaded_fights[fight_type]
		selected_fight = fight_type
		fight_res_path = "res://RDE_Resources/Level Res/" + fight_type + ".tres"

	if new_selected_fight != loaded_selected_fight:
		loaded_selected_fight = new_selected_fight
		FightDescText.text = loaded_selected_fight.LEVEL_DESC
		
func _on_playfight_b_pressed() -> void:
	if selected_fight:
		GlobalScene.set_next_level(fight_res_path)
		GlobalScene.load_next_scene(GlobalScene.GAME)
	else:
		printerr("STORY MENU ERR: SELECTED FIGHT IS BLANK")
